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
        guard let trains = try? Train.query().filter("direction", direction.uppercased()).all() else
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
        let usageString = "Usage: `/sunrail [stations|next|help]`\n`/sunrail stations` - displays a list of station identifiers.\n`/sunrail next {station-identifier} {NB|SB}` - displays the next departure time for the given station in the given direction.\n`/sunrail help` - displays this help message."

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
            let currentDate = Date()

            // If the current date is a Saturday or Sunday, the SunRail isn't running, so we should immediately return
            if currentDate.isWeekend
            {
                return "SunRail does not run on the weekends."
            }

            if parameters.count < 2
            {
                return usageString
            }

            guard let station = try Station.query().filter("slug", parameters[1].lowercased()).first() else
            {
                return "\(parameters[1]) is not a valid station identifier.  Type `/sunrail stations` to see a list of station identifiers."
            }

            guard let direction = Direction(rawValue: parameters[2].uppercased()) else
            {
                return "\(parameters[2]) is not a valid direction.  Please use `NB` for northbound or `SB` for southbound"
            }

            // Need to take care of the special cases of requesting a southbound departure time from Sand Lake Road or a northbound departure time from DeBary, as these are "end of the line" stations
            if ((station.slug == "debary" && direction == .northbound) || (station.slug == "sand-lake-road" && direction == .southbound))
            {
                return "There are no \(direction.toString()) trains departing from the \(station.location) station, as this is the end of the \(direction.toString()) line."
            }

            let trains = (direction == .northbound) ? try Train.northbound() : try Train.southbound()
            let departureTimes = try Schedule.query().filter("station_id", station.id!).filter("train_id", .in, trains.map { $0.id! }).all()

            var nearestTime: String = ""

            let dateString = currentDate.dateString(in: TimeZone(identifier: "America/New_York")!, with: "MMM dd, yyyy")

            for time in departureTimes
            {
                let scheduleTime = Date.date(from: "\(dateString), \(time.departureTime)")
                if scheduleTime > currentDate
                {
                    nearestTime = time.departureTime
                    break
                }
            }

            if nearestTime == ""
            {
                payload.text = "There are no more \(direction.toString()) trains departing from \(station.location)."
            }
            else
            {
                payload.text = "The next \(direction.toString()) train will depart from \(station.location) at \(nearestTime)."
            }

        default:
            payload.text = usageString
        }

        return try JSON(node: payload)
    }
}
