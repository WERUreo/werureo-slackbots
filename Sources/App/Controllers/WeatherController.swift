//
//  WeatherController.swift
//  slack-commands
//
//  Created by Keli'i Martin on 1/8/17.
//
//

import Foundation
import Vapor
import HTTP
import Dispatch

final class WeatherController
{
    enum LocationError : Error, LocalizedError
    {
        case invalidZipcode
        case invalidLocation
        case invalidAddress
        case invalidAPIKey

        var errorDescription: String?
        {
            switch self
            {
                case .invalidAPIKey: return NSLocalizedString("Invalid API Key", comment: "The API key provided is not valid")
                case .invalidAddress: return NSLocalizedString("Invalid address", comment: "The provided zip code does not have a readable address")
                case .invalidZipcode: return NSLocalizedString("Invalid zip code", comment: "The provided zip code is not valid")
                case .invalidLocation: return NSLocalizedString("Invalid location", comment: "The provided zip code does not have valid coordinates")
            }
        }
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Properties
    ////////////////////////////////////////////////////////////

    var drop: Droplet
    let baseURI = "https://api.darksky.net/forecast"

    ////////////////////////////////////////////////////////////
    // MARK: - Initializers
    ////////////////////////////////////////////////////////////

    init(drop: Droplet)
    {
        self.drop = drop
        self.drop.client = FoundationClient.self
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Routes
    ////////////////////////////////////////////////////////////

    func weather(request: Request) throws -> ResponseRepresentable
    {
        guard let apikey = self.drop.config["keys", "darksky"]?.string else
        {
            return "No valid API key"
        }
        
        guard let slackRequest = try? SlackRequest(node: request.formURLEncoded) else
        {
            return "This route is expected to be coming from Slack"
        }

        guard let text = slackRequest.text else
        {
            return "Please include a zip code"
        }

        let responseURL = slackRequest.responseURL

        DispatchQueue.global(qos: .userInitiated).async
        {
            var payload: JSON?

            self.getLatLong(for: text)
            { (coords: (lat: Double, long: Double, city: String)?, error: Error?) in
                do
                {
                    var attachments = [Attachment]()

                    if error != nil
                    {
                        payload = try? JSON(node:
                        [
                            "response_type" : "ephemeral",
                            "text" : "There was an error getting coordinates for \(text): \(error?.localizedDescription)"
                        ])
                    }
                    else
                    {
                        guard let city = coords?.city, let lat = coords?.lat, let long = coords?.long else
                        {
                            return
                        }

                        let apiResponse = try self.drop.client.get("\(self.baseURI)/\(apikey)/\(lat),\(long)")
                        guard let temperature = apiResponse.json?["currently", "temperature"]?.string else
                        {
                            payload = try? JSON(node:
                            [
                                "text" : "Invalid temperature"
                            ])

                            _ = try? self.drop.client.post(responseURL, headers: ["Content-Type" : "application/json"], query: [:], body: (payload?.makeBody())!)
                            return
                        }

                        var attachment = Attachment()
                        attachment.title = "Current weather for \(city)"
                        attachment.text = "\(temperature)º"
                        attachments.append(attachment)

                        payload = try? JSON(node:
                        [
                            "response_type" : "in_channel",
                            "attachments" : try attachments.makeNode()
                        ])
                    }

                    _ = try? self.drop.client.post(responseURL, headers: ["Content-Type" : "application/json"], query: [:], body: (payload?.makeBody())!)
                }
                catch
                {
                    print(error)
                }
            }
        }

        return ""
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Helper Functions
    ////////////////////////////////////////////////////////////

    func getLatLong(for zipcode: String, completion: @escaping ((Double, Double, String)?, Error?) -> ())
    {
        let baseURI = "https://maps.googleapis.com/maps/api/geocode/json"
        do
        {
            guard let apikey = self.drop.config["keys", "google"]?.string else
            {
                completion(nil, LocationError.invalidAPIKey)
                return
            }

            let response = try self.drop.client.get(baseURI, query: ["address" : zipcode, "key" : apikey])
            guard let results = response.json?["results"]?.pathIndexableArray else
            {
                completion(nil, LocationError.invalidZipcode)
                return
            }

            guard let address = results.first?["formatted_address"]?.string else
            {
                completion(nil, LocationError.invalidAddress)
                return
            }

            guard let latitude = results.first?["geometry", "location", "lat"]?.double,
                let longitude = results.first?["geometry", "location", "lng"]?.double else
            {
                completion(nil, LocationError.invalidLocation)
                return
            }

            completion((latitude, longitude, address), nil)
        }
        catch
        {
            completion(nil, error)
        }
    }
}
