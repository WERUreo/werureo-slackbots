//
//  Schedule.swift
//  slack-commands
//
//  Created by Keli'i Martin on 1/22/17.
//
//

import Foundation
import Vapor

struct Schedule
{
    ////////////////////////////////////////////////////////////
    // MARK: - Properties
    ////////////////////////////////////////////////////////////

    static var entity = "station_train"

    var id: Node?
    var exists: Bool = false

    var trainId: Node
    var stationId: Node
    var departureTime: String

    ////////////////////////////////////////////////////////////
    // MARK: - Initializers
    ////////////////////////////////////////////////////////////

    init(trainId: Node, stationId: Node, departureTime: String)
    {
        self.id = nil
        self.trainId = trainId
        self.stationId = stationId
        self.departureTime = departureTime
    }
}

////////////////////////////////////////////////////////////
// MARK: - Model
////////////////////////////////////////////////////////////

extension Schedule : Model
{
    init(node: Node, in context: Context) throws
    {
        self.id             = try node.extract("id")
        self.trainId        = try node.extract("train_id")
        self.stationId      = try node.extract("station_id")
        self.departureTime  = try node.extract("departure_time")
    }

    ////////////////////////////////////////////////////////////

    func makeNode(context: Context) throws -> Node
    {
        return try Node(node:
            [
                "id"                : self.id,
                "train_id"          : self.trainId,
                "station_id"        : self.stationId,
                "departure_time"    : self.departureTime
            ])
    }

    ////////////////////////////////////////////////////////////

    static func prepare(_ database: Database) throws
    {
        try database.create("station_train")
        { train_station in
            train_station.id()
            train_station.int("train_id")
            train_station.int("station_id")
            train_station.string("departure_time")
        }
    }

    ////////////////////////////////////////////////////////////
    
    static func revert(_ database: Database) throws
    {
        try database.delete("station_train")
    }
}
