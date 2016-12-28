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
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Routes
    ////////////////////////////////////////////////////////////

    func alright(request: Request) throws -> ResponseRepresentable
    {
        var attachments = Attachment()
        attachments.imageURL = "https://s3.amazonaws.com/werureo-random/hurricane_matthew.png"

        let payload = try JSON(node:
            [
                "response_type": "in_channel",
                "attachments": JSON([try attachments.makeNode()])
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

        do
        {
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

            var attachments = Attachment()
            attachments.text = message
            attachments.color = status ? "#00ff00" : "#ff0000"

            let payload = try JSON(node:
                [
                    "response_type" : "ephemeral",
                    "attachments" : JSON([try attachments.makeNode()])
                ])
            
            return payload
        }
        catch
        {
            return "\(error)"
        }

    }

    ////////////////////////////////////////////////////////////

    func apod(request: Request) throws -> ResponseRepresentable
    {
        guard let apiKey = self.drop.config["keys", "nasa"]?.string else
        {
            return "No valid API key"
        }

        let uri = "https://api.nasa.gov/planetary/apod"

        do
        {
            let apiResponse = try drop.client.get(uri, query: ["api_key": apiKey])

            let title = apiResponse.json?["title"]?.string ?? ""
            let explanation = apiResponse.json?["explanation"]?.string ?? ""
            let imageURL = apiResponse.json?["url"]?.string ?? ""

            var attachments = Attachment()
            attachments.title = title
            attachments.text = explanation
            attachments.imageURL = imageURL
            attachments.footer = "NASA"

            let payload = try JSON(node:
                [
                    "response_type" : "in_channel",
                    "attachments" : JSON([try attachments.makeNode()])
                ])
            
            return payload
        }
        catch
        {
            return "\(error)"
        }
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
            case "#people": uri = baseUri + "/people/"
            case "#bills": uri = baseUri + "/bills/"
            case "#votes": uri = baseUri + "/votes/"
            case "#organizations": uri = baseUri + "/organizations/"
            case "#memberships": uri = baseUri + "/memberships/"
            case "#help": return "This will be for help"
            default: return "\(text) is not a valid option."
        }

        do
        {
            let apiResponse = try drop.client.get(uri, headers: ["X-APIKEY" : apikey], query: [:], body: "")
            guard let bytes = apiResponse.body.bytes else
            {
                return "Body of HTTP response was empty"
            }

            guard let json = try? JSON(bytes: bytes) else
            {
                return "There was a problem parsing the data"
            }

            guard let bills = json["data"]?.pathIndexableArray else
            {
                return "There were no bills returned by the query."
            }

            for bill in bills
            {
                print(bill["attributes", "title"]?.string ?? "No title")
            }
            return try JSON(bytes: bytes)
        }
        catch
        {
            return "\(error)"
        }
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
            do
            {
                let apiResponse = try drop.client.get("\(baseUrl)\(parameters[1])/profile")

                guard let username = apiResponse.json?["data", "username"]?.string,
                    let avatar = apiResponse.json?["data", "avatar"]?.string else
                {
                    throw Abort.custom(status: .notFound, message: "No response from API")
                }

                let fields =
                    [
                        AttachmentsField(title: "Title", value: "Value", isShort: true),
                        AttachmentsField(title: "Title 2", value: "Value 2", isShort: true)
                    ]

                var attachments = Attachment()
                attachments.color = "#00ff00"
                attachments.pretext = "Profile for \(parameters[1])"
                attachments.title = username
                attachments.fields = fields
                attachments.thumbURL = avatar

                payload = try JSON(node:
                    [
                        "response_type" : "in_channel",
                        "attachments" : JSON([try attachments.makeNode()])
                    ])
            }
            catch
            {
                return "\(error)"
            }
        }
        else
        {
            return "\(parameters[0]) is an invalid option."
        }

        return payload
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Tabs on Tallahassee Helper Functions
    ////////////////////////////////////////////////////////////

    func bills(json: JSON)
    {

    }
}
