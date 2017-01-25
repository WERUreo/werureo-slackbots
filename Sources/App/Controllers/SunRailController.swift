//
//  SunRailController.swift
//  slack-commands
//
//  Created by Keli'i Martin on 1/21/17.
//
//

import Foundation
import Vapor
import HTTP

final class SunRailController
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
    // MARK: - Add Routes
    ////////////////////////////////////////////////////////////

    func addRoutes()
    {
        self.drop.get("stations", handler: stations)
        self.drop.get("trains", handler: trains)
        self.drop.get("schedule", Station.self, Train.self, handler: schedule)
        self.drop.post("sunrail", handler: sunrail)
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Endpoints
    ////////////////////////////////////////////////////////////

    func stations(request: Request) throws -> ResponseRepresentable
    {
        return try JSON(node: Station.all().makeNode())
    }

    ////////////////////////////////////////////////////////////

    func trains(request: Request) throws -> ResponseRepresentable
    {
        return try JSON(node: Train.all().makeNode())
    }

    ////////////////////////////////////////////////////////////

    func schedule(request: Request, station: Station, train: Train) throws -> ResponseRepresentable
    {
        let departure = try Schedule.query().filter("station_id", station.id!).filter("train_id", train.id!).first()
        return departure?.arrivalTime ?? "???"
    }

    ////////////////////////////////////////////////////////////

    func sunrail(request: Request) throws -> ResponseRepresentable
    {
        guard let slackRequest = try? SlackRequest(node: request.formURLEncoded) else
        {
            return "This endpoint is intended for use with Slack."
        }

        guard let text = slackRequest.text else
        {
            return "Usage: /sunrail [stations|next|help]"
        }

        let parameters = text.components(separatedBy: " ")

        var payload = SlackPayload()

        switch parameters[0]
        {
            case "stations":
                let stations = try Station.query().all()

                var locationText: String = ""
                var slugText: String = ""
                for station in stations
                {
                    locationText += "\(station.location)\n"
                    slugText += "\(station.slug)\n"
                }

                let fields =
                [
                    AttachmentsField(title: "Station", value: locationText, isShort: true),
                    AttachmentsField(title: "Slug", value: slugText, isShort: true)
                ]

                var attachment = Attachment()
                attachment.fields = fields

                payload.attachments = [attachment]
                payload.responseType = .ephemeral
            default:
                return ""
        }

        return try JSON(node: payload)
    }
}
