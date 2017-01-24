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
        return ""
    }
}
