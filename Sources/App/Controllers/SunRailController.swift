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

        var departureTimes: String = ""

        for train in trains
        {
            if let schedule = try Schedule.query().filter("train_id", train.id!).filter("station_id", station.id!).first()
            {
                departureTimes += "\(schedule.departureTime)\n"
            }
        }

        return departureTimes
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
        let usageString = "Usage: /sunrail [stations|next|help]"

        guard let slackRequest = try? SlackRequest(node: request.formURLEncoded) else
        {
            return "This endpoint is intended for use with Slack."
        }

        guard let text = slackRequest.text else
        {
            return usageString
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
                AttachmentField(title: "Identifier", value: slugText, isShort: true)
            ]

            var attachment = Attachment()
            attachment.fields = fields

            payload.attachments = [attachment]

        case "next":
            if parameters.count < 2
            {
                payload.text = "Usage: `/sunrail next {stationIdentifier} {direction}`\nTo see a list of station identifiers, type `/sunrail stations`.\nValid directions are `NB` and `SB`"
                break
            }

            guard let station = try Station.query().filter("slug", parameters[1].lowercased()).first() else
            {
                payload.text = "\(parameters[1]) is not a valid station identifier.  Type `/sunrail stations` to see a list of station identifiers."
                return try JSON(node: payload)
            }

            let direction = parameters[2].uppercased()
            print(direction)
            if direction != "NB" && direction != "SB"
            {
                payload.text = "\(parameters[2]) is not a valid direction.  Please use `NB` for northbound or `SB` for southbound"
                break
            }

            let trains = (direction == "NB") ? try Train.northbound() : try Train.southbound()
            let departureTimes = try Schedule.query().filter("station_id", station.id!).filter("train_id", .in, trains.map { $0.id! }).all()

            let currentDate = Date()

            // If the current date is a Saturday or Sunday, the SunRail isn't running, so we should immediately return
            if currentDate.isWeekend
            {
                payload.text = "SunRail does not run on the weekends."
                return try JSON(node: payload)
            }

            var nearestTime: String = ""

            for time in departureTimes
            {
                let formatter = DateFormatter()
                formatter.dateFormat = "MMM dd, yyyy"
                formatter.timeZone = TimeZone(identifier: "America/New_York")!
                let dateString = formatter.string(from: currentDate)

                formatter.dateFormat = "MMM dd, yyyy, h:mm a"
                let scheduleTime = formatter.date(from: "\(dateString), \(time.departureTime)")
                if scheduleTime! > currentDate
                {
                    nearestTime = time.departureTime
                    break
                }
            }

            payload.text = "The next \(direction == "NB" ? "northbound" : "southbound") train will depart from \(station.location) at \(nearestTime)."

        default:
            payload.text = usageString
        }

        return try JSON(node: payload)
    }
}
