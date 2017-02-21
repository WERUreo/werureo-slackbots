//
//  MeetupController.swift
//  slack-commands
//
//  Created by Keli'i Martin on 2/16/17.
//
//

import Foundation
import Vapor
import HTTP
import Dispatch

final class MeetupController
{
    ////////////////////////////////////////////////////////////
    // MARK: - Properties
    ////////////////////////////////////////////////////////////

    var drop: Droplet
    let baseURI = "https://api.meetup.com"

    ////////////////////////////////////////////////////////////
    // MARK: - Initializer
    ////////////////////////////////////////////////////////////

    init(drop: Droplet)
    {
        self.drop = drop
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Add Routes
    ////////////////////////////////////////////////////////////

    func addRoutes()
    {
        self.drop.post("cfo", handler: cfo)
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Routes
    ////////////////////////////////////////////////////////////

    func cfo(request: Request) throws -> ResponseRepresentable
    {
        guard let slackRequest = try? SlackRequest(node: request.formURLEncoded) else
        {
            return "This endpoint is intended for use with Slack."
        }

        DispatchQueue.global(qos: .userInitiated).async
        {
            var payload = SlackPayload()

            let apiResponse = try? self.drop.client.get("\(self.baseURI)/Code-For-Orlando/events")
            if let nextEvent = apiResponse?.json?.pathIndexableArray?.first
            {
                let eventName = nextEvent["name"]?.string ?? "No event name"
                let time = nextEvent["time"]?.int ?? 0
                let link = nextEvent["link"]?.string
                let description = nextEvent["description"]?.string ?? ""
                let howToFindUs = nextEvent["how_to_find_us"]?.string

                var attachment = Attachment()
                attachment.color = "#ed8323"
                attachment.title = eventName
                if let link = link { attachment.titleLink = link }

                // construct date string
                let dateTime = Date(timeIntervalSince1970: TimeInterval(time / 1000)).dateString(in: TimeZone(identifier: "America/New_York"), with: "EEEE, MMM d, yyyy h:mm a")
                attachment.text = "\(dateTime)\n\(self.markdownifyString(description))"
                attachment.markdown = ["fields", "text"]

                var fields = [AttachmentField]()

                if let venue = nextEvent["venue"]
                {
                    let venueName = venue["name"]?.string ?? ""
                    let venueAddr1 = venue["address_1"]?.string ?? ""
                    let venueAddr2 = venue["address_2"]?.string ?? ""
                    let venueCity = venue["city"]?.string ?? ""
                    let venueState = venue["state"]?.string ?? ""
                    let venueZip = venue["zip"]?.string ?? ""

                    let venueString = "\(venueName)\n\(venueAddr1)\n\(venueAddr2)\n\(venueCity), \(venueState) \(venueZip)"

                    let venueField = AttachmentField(title: "Venue Information", value: venueString, isShort: true)
                    fields.append(venueField)

                    // create map image url
                    if let lat = venue["lat"]?.double,
                        let long = venue["lon"]?.double,
                        let googlekey = self.drop.config["keys", "google"]?.string
                    {
                        let imageURL = "https://maps.googleapis.com/maps/api/staticmap?size=500x400&zoom=17&markers=color:red%7C\(lat),\(long)&key=\(googlekey)"
                        attachment.imageURL = imageURL
                    }
                }

                if let howToFindUs = howToFindUs
                {
                    let findUsField = AttachmentField(title: "How to Find Us", value: howToFindUs, isShort: true)
                    fields.append(findUsField)
                }

                attachment.fields = fields

                var attachments = [Attachment]()
                attachments.append(attachment)

                payload.responseType = .inChannel
                payload.text = "Join Code for Orlando at our next event!"
                payload.attachments = attachments
            }
            else
            {
                payload.responseType = .ephemeral
                payload.text = "There doesn't appear to be any Code for Orlando meetups scheduled yet.  Keep an eye out for new meetups on meetup.com!"
            }

            _ = try? self.drop.client.post(slackRequest.responseURL,
                                           headers: ["Content-Type" : "application/json"],
                                           query: [:],
                                           body: JSON(node: try? payload.makeNode()))
        }

        return ""
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Helper Functions
    ////////////////////////////////////////////////////////////

    func markdownifyString(_ inString: String) -> String
    {
        var newString = inString

        // replace <i> and </i> with _
        newString = newString.replacingOccurrences(of: "<[/]*i>", with: "_", options: .regularExpression, range: nil)

        // replace <b> and </b> with *
        newString = newString.replacingOccurrences(of: "<[/]*b>", with: "*", options: .regularExpression, range: nil)

        // remove <p> completely
        newString = newString.replacingOccurrences(of: "<p>", with: "")

        // replace </p> with \n\n
        newString = newString.replacingOccurrences(of: "</p>", with: "\n\n")

        // replace <br /> with \n
        newString = newString.replacingOccurrences(of: "<br[ ]*[/]+>", with: "\n", options: .regularExpression, range: nil)

        // remove all <a> and </a> completely
        newString = newString.replacingOccurrences(of: "<[/]*a[^>]*>", with: "", options: .regularExpression, range: nil)

        return newString
    }
}
