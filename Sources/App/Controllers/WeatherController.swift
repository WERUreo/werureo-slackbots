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

final class WeatherController
{
    ////////////////////////////////////////////////////////////
    // MARK: - Properties
    ////////////////////////////////////////////////////////////

    var drop: Droplet
    let baseURI = "https://api.darksky.net/forecast/"

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
        
        return "\(text)"
    }
}
