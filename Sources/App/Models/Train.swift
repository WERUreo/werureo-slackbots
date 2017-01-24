//
//  Train.swift
//  slack-commands
//
//  Created by Keli'i Martin on 1/22/17.
//
//

import Foundation
import Vapor
import Fluent

public enum Direction: String
{
    case northbound = "NB"
    case southbound = "SB"
}

struct Train
{
    var id: Node?
    var exists: Bool = false

    var number: Int
    var direction: String

    init(number: Int, direction: Direction)
    {
        self.id = nil
        self.number = number
        self.direction = direction.rawValue
    }
}

extension Train : Model
{
    init(node: Node, in context: Context) throws
    {
        self.id         = try node.extract("id")
        self.number     = try node.extract("number")
        self.direction  = try node.extract("direction")
    }

    func makeNode(context: Context) throws -> Node
    {
        return try Node(node:
        [
            "id"        : self.id,
            "number"    : self.number,
            "direction" : self.direction
        ])
    }

    static func prepare(_ database: Database) throws
    {
        try database.create("trains")
        { trains in
            trains.id()
            trains.int("number")
            trains.string("direction")
        }
    }

    static func revert(_ database: Database) throws
    {
        try database.delete("trains")
    }
}

extension Train
{
    func northbound() throws -> [Train]
    {
        return try Train.query().filter("direction", "NB").all()
    }

    ////////////////////////////////////////////////////////////

    func southbound() throws -> [Train]
    {
        return try Train.query().filter("direction", "SB").all()
    }

    ////////////////////////////////////////////////////////////

    func stations() throws -> [Station]
    {
        let stations: Siblings<Station> = try siblings()
        return try stations.all()
    }
}
