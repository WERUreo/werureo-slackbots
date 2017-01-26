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
        let stations = self.drop.grouped("stations")
        stations.get(handler: listAllStations)

        let trains = drop.grouped("trains")
        trains.get(handler: listAllTrains)
        trains.get(String.self, "station", String.self, handler: listTrainTimes)

        self.drop.get("schedule", Station.self, Train.self, handler: schedule)
        self.drop.post("sunrail", handler: sunrail)
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Endpoints
    ////////////////////////////////////////////////////////////

    func listAllStations(request: Request) throws -> ResponseRepresentable
    {
        return try JSON(node: Station.all().makeNode())
    }

    ////////////////////////////////////////////////////////////

    func listAllTrains(request: Request) throws -> ResponseRepresentable
    {
        return try JSON(node: Train.all().makeNode())
    }

    ////////////////////////////////////////////////////////////

    func listTrainTimes(request: Request, direction: String, station: String) throws -> ResponseRepresentable
    {
        guard let trains = try? Train.query().filter("direction", direction).all() else
        {
            return "No trains found"
        }

        guard let station = try Station.query().filter("slug", station).first() else
        {
            return "Invalid station"
        }

        var departureTimes = [String]()

        for train in trains
        {
            if let schedule = try Schedule.query().filter("train_id", train.id!).filter("station_id", station.id!).first()
            {
                departureTimes.append(schedule.departureTime)
            }
        }

        var allTimes: String = ""
        for time in departureTimes
        {
            allTimes += "\(time)\n"
        }

        return allTimes
    }

    ////////////////////////////////////////////////////////////

    func schedule(request: Request, station: Station, train: Train) throws -> ResponseRepresentable
    {
        let departure = try Schedule.query().filter("station_id", station.id!).filter("train_id", train.id!).first()
        return departure?.departureTime ?? "????"
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
                AttachmentField(title: "Station", value: locationText, isShort: true),
                AttachmentField(title: "Slug", value: slugText, isShort: true)
            ]

            var attachment = Attachment()
            attachment.fields = fields

            payload.attachments = [attachment]
            payload.responseType = .ephemeral
        default:
            payload.responseType = .ephemeral
            payload.text = "Usage: "
        }

        return try JSON(node: payload)
    }
}
