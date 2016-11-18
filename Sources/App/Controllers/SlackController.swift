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
//        var uri = "https://us.api.battle.net/wow/realm/status?locale=en_US&apikey="

        guard let apiKey = self.drop.config["keys", "battlenet"]?.string else { return "No valid API key" }

        return apiKey

//        uri.append(apiKey)
//
//        guard let text = request.data["text"]?.string else { return "Please enter the name of a World of Warcraft realm." }
//
//        let apiResponse = try BasicClient.get(uri)
//
//        guard let realms = apiResponse.json?["realms"]?.pathIndexableArray else { return "No realms" }
//
//        guard let selectedRealm = realms.filter(
//        { (realm) -> Bool in
//            realm["name"]?.string?.lowercased() == text.lowercased()
//        }).first
//        else
//        {
//            return "\(text) is not a valid realm"
//        }
//
//        let realmName = selectedRealm["name"]?.string ?? "Invalid name"
//        let status = selectedRealm["status"]?.bool ?? false
//
//        let message = "\(realmName) \(status ? "is" : "is not") online."
//        let payload = try JSON(node:
//            [
//                "response_type" : "ephemeral",
//                "text" : message
//            ])
//
//        return payload
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Helper functions
    ////////////////////////////////////////////////////////////

    fileprivate func getEnvironmentVariable(name: String) -> String?
    {
        guard let rawValue = getenv(name) else { return nil }
        return String(utf8String: rawValue)
    }
}
