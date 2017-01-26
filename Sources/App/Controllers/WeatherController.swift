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
    ////////////////////////////////////////////////////////////
    // MARK: - Enumerations
    ////////////////////////////////////////////////////////////

    enum LocationError: Error, LocalizedError
    {
        case invalidZipcode
        case invalidLocation
        case invalidAddress
        case invalidAPIKey

        var errorDescription: String?
        {
            switch self
            {
                case .invalidAPIKey: return "The API key provided is not valid"
                case .invalidAddress: return "The provided zip code does not have a readable address"
                case .invalidZipcode: return "The provided zip code is not valid"
                case .invalidLocation: return "The provided zip code does not have valid coordinates"
            }
        }
    }

    ////////////////////////////////////////////////////////////

    enum WeatherIcon: String
    {
        case clearDay           = "clear-day"
        case clearNight         = "clear-night"
        case rain               = "rain"
        case snow               = "snow"
        case sleet              = "sleet"
        case wind               = "wind"
        case fog                = "fog"
        case cloudy             = "cloudy"
        case partlyCloudyDay    = "partly-cloudy-day"
        case partlyCloudyNight  = "partly-cloudy-night"
        case undefined          = ""

        func iconString() -> String
        {
            var icon: String
            let baseURL = "https://icons.wxug.com/i/c/j"

            switch self
            {
                case .clearDay:             icon = "\(baseURL)/clear.gif"
                case .clearNight:           icon = "\(baseURL)/nt_clear.gif"
                case .rain:                 icon = "\(baseURL)/rain.gif"
                case .snow:                 icon = "\(baseURL)/snow.gif"
                case .sleet:                icon = "\(baseURL)/sleet.gif"
                case .wind:                 icon = "\(baseURL)/hazy.gif"
                case .fog:                  icon = "\(baseURL)/fog.gif"
                case .cloudy:               icon = "\(baseURL)/cloudy.gif"
                case .partlyCloudyDay:      icon = "\(baseURL)/partlycloudy.gif"
                case .partlyCloudyNight:    icon = "\(baseURL)/nt_partlycloudy.gif"
                default:                    icon = "\(baseURL)/sunny.gif"
            }

            return icon
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
    // MARK: - Add Routes
    ////////////////////////////////////////////////////////////

    func addRoutes()
    {
        self.drop.post("weather", handler: weather)
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

        DispatchQueue.global(qos: .userInitiated).async
        {
            var payload = SlackPayload()

            self.getLatLong(for: text)
            { (coords: (lat: Double, long: Double, city: String)?, error: Error?) in
                var attachments = [Attachment] ()

                if error != nil
                {
                    payload.responseType = .ephemeral
                    payload.text = "There was an error getting coordinates for \(text): \(error?.localizedDescription)"
                }
                else
                {
                    guard let city = coords?.city, let lat = coords?.lat, let long = coords?.long else
                    {
                        return
                    }

                    // GET https://api.darksky.net/forecast/[key]/[latitude],[longitude]?exclude=minutely,hourly,daily,flag
                    let apiResponse = try self.drop.client.get("\(self.baseURI)/\(apikey)/\(lat),\(long)", query: ["exclude" : "minutely,flags"])

                    let currently = apiResponse.json?["currently"]
                    let hourly = apiResponse.json?["hourly"]
                    let daily = apiResponse.json?["daily"]
                    let today = daily?["data"]?.pathIndexableArray?.first

                    let currentTemp = currently?["temperature"]?.double?.temperatureString() ?? "--"
                    let feelsLikeTemp = currently?["apparentTemperature"]?.double?.temperatureString() ?? "--"
                    let dewPointTemp = currently?["dewPoint"]?.double?.temperatureString() ?? "--"

                    let highTemp = today?["temperatureMax"]?.double?.temperatureString() ?? "--"
                    let lowTemp = today?["temperatureMin"]?.double?.temperatureString() ?? "--"
                    let hourlySummary = hourly?["summary"]?.string ?? ""

                    var wind: String = "--"
                    if let windBearing = currently?["windBearing"]?.int,
                        let windSpeed = currently?["windSpeed"]?.double
                    {
                        wind = "From the \(self.windDirection(from: windBearing)) at \(Int(windSpeed.rounded())) MPH"
                    }

                    var precipChance = "0%"
                    if let precip = currently?["precipProbability"]?.double
                    {
                        precipChance = "\(Int((precip * 100).rounded()))%"
                    }

                    let summary = currently?["summary"]?.string ?? ""
                    let icon = currently?["icon"]?.string ?? ""

                    let fields =
                    [
                        AttachmentField(title: "High", value: highTemp, isShort: true),
                        AttachmentField(title: "Low", value: lowTemp, isShort: true),
                        AttachmentField(title: "Wind", value: wind, isShort: true),
                        AttachmentField(title: "Feels Like", value: feelsLikeTemp, isShort: true),
                        AttachmentField(title: "Chance of Precipitation", value: precipChance, isShort: true),
                        AttachmentField(title: "Dew Point", value: dewPointTemp, isShort: true)
                    ]
                    
                    var attachment = Attachment()
                    attachment.title = "It is currently \(currentTemp) \(summary) in \(city)"
                    attachment.text = hourlySummary
                    attachment.fields = fields
                    attachment.color = "good"
                    attachment.thumbURL = WeatherIcon(rawValue: icon)?.iconString()
                    attachments.append(attachment)

                    // Alerts
                    if let alerts = apiResponse.json?["alerts"]?.pathIndexableArray
                    {
                        for alert in alerts
                        {
                            var alertAttachment = Attachment()
                            alertAttachment.title = alert["title"]?.string ?? "--"
                            alertAttachment.titleLink = alert["uri"]?.string ?? ""
                            alertAttachment.color = "danger"
                            alertAttachment.text = alert["description"]?.string ?? ""

                            attachments.append(alertAttachment)
                        }
                    }

                    // Add the "Powered by Dark Sky" footer to the last attachment
                    attachments[attachments.count - 1].footer = "<https://darksky.net/poweredby/|Powered by Dark Sky>"

                    payload.responseType = .inChannel
                    payload.text = "\(slackRequest.userName) requested the weather for \(text)"
                    payload.attachments = attachments
                }

                _ = try? self.drop.client.post(slackRequest.responseURL,
                                               headers: ["Content-Type" : "application/json"],
                                               query: [:],
                                               body: JSON(node: try? payload.makeNode()))
            }
        }

        return ""
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Helper Functions
    ////////////////////////////////////////////////////////////

    func getLatLong(for zipcode: String, completion: @escaping ((Double, Double, String)?, Error?) throws -> ())
    {
        let baseURI = "https://maps.googleapis.com/maps/api/geocode/json"
        do
        {
            guard let apikey = self.drop.config["keys", "google"]?.string else
            {
                try? completion(nil, LocationError.invalidAPIKey)
                return
            }

            let response = try self.drop.client.get(baseURI, query: ["address" : zipcode, "key" : apikey])
            guard let results = response.json?["results"]?.pathIndexableArray else
            {
                try? completion(nil, LocationError.invalidZipcode)
                return
            }

            guard let address = results.first?["formatted_address"]?.string else
            {
                try? completion(nil, LocationError.invalidAddress)
                return
            }

            guard let latitude = results.first?["geometry", "location", "lat"]?.double,
                let longitude = results.first?["geometry", "location", "lng"]?.double else
            {
                try? completion(nil, LocationError.invalidLocation)
                return
            }

            try? completion((latitude, longitude, address), nil)
        }
        catch
        {
            try? completion(nil, error)
        }
    }

    ////////////////////////////////////////////////////////////

    func windDirection(from degrees: Int) -> String
    {
        let directions = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
        let index = Int((Double(degrees) + 11.25) / 22.5)
        return directions[index % 16]
    }
}

////////////////////////////////////////////////////////////

extension Double
{
    func temperatureString() -> String
    {
        return "\(Int(self.rounded()))º F"
    }
}
