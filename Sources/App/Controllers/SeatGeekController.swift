//
//  SeatGeekController.swift
//  slack-commands
//
//  Created by Keli'i Martin on 12/16/16.
//
//

import Foundation
import Vapor
import HTTP

final class SeatGeekController
{
    ////////////////////////////////////////////////////////////
    // MARK: - Properties
    ////////////////////////////////////////////////////////////

    var drop: Droplet
    let baseURI: String = "https://api.seatgeek.com/2"

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

    func parking(request: Request) throws -> ResponseRepresentable
    {
        let uri = "\(baseURI)/events"

        var inChannel: Bool = false
        if let text = request.data["text"]?.string
        {
            inChannel = (text == "share") ? true : false
        }

        guard let apikey = self.drop.config["keys", "seatgeek"]?.string else
        {
            return "No valid API key"
        }

        let now = Date()
        // NOTE: Setting the timezone to "America/New_York" ensures that no matter where the host server is located, now() will represent the current date/time in EST
        let apiResponse = try drop.client.get(uri, query:
            [
                "venue.id" : "3721,2652", // venue ids for the Amway Center and Camping World Stadium
                "datetime_local.gte" : now.dateString(in: TimeZone(identifier: "America/New_York")),
                "datetime_local.lt" : now.adding(.day, value: 1).dateString(in: TimeZone(identifier: "America/New_York")),
                "client_id" : apikey
            ])

        guard let events = apiResponse.json?["events"]?.pathIndexableArray else
        {
            return "Problem returning events"
        }

        var payload: JSON
        if events.count == 0
        {
            payload = try JSON(node:
                [
                    "response_type" : inChannel ? "in_channel" : "ephemeral",
                    "text" : "There don't appear to be any events today that will affect parking."
                ])
        }
        else
        {
            var fields = [AttachmentsField]()

            for event in events
            {
                let title = event["title"]?.string ?? "Unknown event"
                let venue = event["venue", "name"]?.string ?? "Unknown venue"
                var time = ""
                if let timeString = event["datetime_local"]?.string
                {
                    time = Date(iso8601String: timeString).timeString(ofStyle: .short)
                }

                let field = AttachmentsField(title: title,
                                             value: "\(venue) - \(time)",
                                             isShort: false)
                fields.append(field)
            }

            if !inChannel
            {
                let field = AttachmentsField(title: "",
                                             value: "To share this information in the current channel, type `/parking share`",
                                             isShort: false)
                fields.append(field)
            }

            let attachments = try JSON(node:
                [
                    "fields" : try fields.makeNode(),
                    "color" : "#ff0000",
                    "footer" : "Powered by SeatGeek",
                    "mrkdwn_in" : ["fields"]
                ])

            payload = try JSON(node:
                [
                    "response_type" : inChannel ? "in_channel" : "ephemeral",
                    "text" : "The following \(events.count == 1 ? "event is" : "events are") taking place today that may affect downtown parking:",
                    "attachments" : JSON([attachments])
                ])
        }

        return payload
    }
}
