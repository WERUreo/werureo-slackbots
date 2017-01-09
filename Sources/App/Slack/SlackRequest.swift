//
//  SlackRequest.swift
//  slack-commands
//
//  Created by Keli'i Martin on 1/1/17.
//
//

import Foundation
import Vapor

struct SlackRequest
{
    ////////////////////////////////////////////////////////////
    // MARK: - Properties
    ////////////////////////////////////////////////////////////

    var channelID: String = ""
    var responseURL: String = ""
    var channelName: String = ""
    var token: String = ""
    var userID: String = ""
    var userName: String = ""
    var text: String?
    var command: String = ""
    var teamID: String = ""
    var teamDomain: String = ""

    ////////////////////////////////////////////////////////////
    // MARK: - Initializers
    ////////////////////////////////////////////////////////////

    init(node: Node?) throws
    {
        guard let node = node else
        {
            return
        }

        self.channelID = try node.extract("channel_id")
        self.responseURL = try node.extract("response_url")
        self.channelName = try node.extract("channel_name")
        self.token = try node.extract("token")
        self.userID = try node.extract("user_id")
        self.userName = try node.extract("user_name")
        self.text = try node.extract("text")
        self.command = try node.extract("command")
        self.teamID = try node.extract("team_id")
        self.teamDomain = try node.extract("team_domain")
    }
}
