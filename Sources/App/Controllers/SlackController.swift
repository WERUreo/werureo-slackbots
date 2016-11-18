//
//  SlackController.swift
//  slack-commands
//
//  Created by Keli'i Martin on 11/17/16.
//
//

import Vapor
import HTTP

final class SlackController
{
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
}
