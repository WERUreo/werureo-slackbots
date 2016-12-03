//
//  SlackController.swift
//  slack-commands
//
//  Created by Keli'i Martin on 11/17/16.
//
//

import Vapor
import HTTP
import Transport
import Foundation

final class SlackController
{
    ////////////////////////////////////////////////////////////
    // MARK: - Properties
    ////////////////////////////////////////////////////////////

    var drop: Droplet

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

    func alright(request: Request) throws -> ResponseRepresentable
    {
        let attachments = try JSON(node:
            [
                "image_url": "https://s3.amazonaws.com/werureo-random/hurricane_matthew.png"
            ])

        let payload = try JSON(node:
            [
                "response_type": "in_channel",
                "attachments": JSON([attachments])
            ])
        
        return payload
    }

    ////////////////////////////////////////////////////////////

    func realmstatus(request: Request) throws -> ResponseRepresentable
    {
        guard let apiKey = self.drop.config["keys", "battlenet"]?.string else
        {
            return "No valid API key"
        }

        let uri = "https://us.api.battle.net/wow/realm/status"
        guard let text = request.data["text"]?.string else
        {
            return "Please enter the name of a World of Warcraft realm."
        }

        let apiResponse = try self.drop.client.get(uri, query: ["locale" : "en_US", "apikey" : apiKey])
        guard let realms = apiResponse.json?["realms"]?.pathIndexableArray else
        {
            return "No realms"
        }

        guard let selectedRealm = realms.filter(
        { (realm) -> Bool in
            realm["name"]?.string?.lowercased() == text.lowercased()
        }).first
        else
        {
            return "\(text) is not a valid realm"
        }

        let realmName = selectedRealm["name"]?.string ?? "Invalid name"
        let status = selectedRealm["status"]?.bool ?? false

        let message = "\(realmName) \(status ? "is" : "is not") online."
        let payload = try JSON(node:
            [
                "response_type" : "ephemeral",
                "text" : message
            ])

        return payload
    }

    ////////////////////////////////////////////////////////////

    func apod(request: Request) throws -> ResponseRepresentable
    {
        guard let apiKey = self.drop.config["keys", "nasa"]?.string else
        {
            return "No valid API key"
        }

        let uri = "https://api.nasa.gov/planetary/apod"
        let apiResponse = try drop.client.get(uri, query: ["api_key": apiKey])

        let title = apiResponse.json?["title"]?.string ?? ""
        let explanation = apiResponse.json?["explanation"]?.string ?? ""
        let imageURL = apiResponse.json?["url"]?.string ?? ""

        let attachments = try JSON(node:
            [
                "title" : title,
                "text" : explanation,
                "image_url" : imageURL,
                "footer" : "NASA"
            ])

        let payload = try JSON(node:
            [
                "response_type" : "in_channel",
                "attachments" : JSON([attachments])
            ])

        return payload
    }

    ////////////////////////////////////////////////////////////

    func tabsOnTally(request: Request) throws -> ResponseRepresentable
    {
        let baseUri = "https://tabsontallahassee.com/api"
        var uri: String = ""

        guard let apikey = self.drop.config["keys", "tabsontallahassee"]?.string else
        {
            return "No valid API key"
        }

        guard let text = request.data["text"]?.string else
        {
            return "Please use `/tabsontally #help` to see all available options"
        }

        switch text
        {
            case "#people": uri = baseUri + "/people"
            case "#bills": uri = baseUri + "/bills"
            case "#votes": uri = baseUri + "/votes"
            case "#organizations": uri = baseUri + "/organizations"
            case "#memberships": uri = baseUri + "/memberships"
            case "#help": return "This will be for help"
            default: return "\(text) is not a valid option."
        }

        var apiResponse: ResponseRepresentable

        do
        {
            apiResponse = try self.drop.client.get(uri, headers: ["X-APIKEY" : apikey], query: [:], body: "")
        }

        catch ClientError.invalidRequestHost
        {
            apiResponse = "Invalid Request Host"
        }
        catch ClientError.invalidRequestScheme
        {
            apiResponse = "Invalid Request Scheme"
        }
        catch ClientError.invalidRequestPort
        {
            apiResponse = "Invalid Request Port"
        }
        catch ClientError.unableToConnect
        {
            apiResponse = "Unable To Connect"
        }
        catch ClientError.userInfoNotAllowedOnHTTP
        {
            apiResponse = "User Info Not Allowed on HTTP"
        }
        catch
        {
            apiResponse = "Something bad happened"
        }

        return apiResponse
    }

    ////////////////////////////////////////////////////////////

    func overwatch(request: Request) throws -> ResponseRepresentable
    {
        let baseUrl = "https://api.lootbox.eu/pc/us/"

        guard let text = request.data["text"]?.string else
        {
            return "Overwatch Bot v1.0"
        }

        var payload: JSON
        let parameters = text.components(separatedBy: " ")

        if parameters[0] == "#profile"
        {
            let apiResponse = try drop.client.get("\(baseUrl)\(parameters[1])/profile")

            guard let username = apiResponse.json?["data", "username"]?.string,
                let avatar = apiResponse.json?["data", "avatar"]?.string else
            {
                throw Abort.custom(status: .notFound, message: "No response from API")
            }

            let fields = try JSON(
                [
                    AttachmentsField(title: "Title", value: "Value", isShort: true).makeNode(),
                    AttachmentsField(title: "Title 2", value: "Value 2", isShort: true).makeNode()
                ])

            let attachments = try JSON(node:
                [
                    "pretext" : "Profile for \(parameters[1])",
                    "color" : "#00ff00",
                    "title" : username,
                    "thumb_url" : avatar,
                    "fields" : fields
                ])

            payload = try JSON(node:
                [
                    "response_type" : "in_channel",
                    "attachments" : JSON([attachments])
                ])
        }
        else
        {
            return "\(parameters[0]) is an invalid option."
        }

        return payload
    }
}
