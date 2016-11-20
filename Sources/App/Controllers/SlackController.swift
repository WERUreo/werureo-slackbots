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
}
