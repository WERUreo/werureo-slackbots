//
//  Station.swift
//  slack-commands
//
//  Created by Keli'i Martin on 1/22/17.
//
//

import Foundation
import Vapor
import Fluent

struct Station
{
    ////////////////////////////////////////////////////////////
    // MARK: - Properties
    ////////////////////////////////////////////////////////////

    var id: Node?
    var exists: Bool = false

    var slug: String
    var location: String
    var address: String

    ////////////////////////////////////////////////////////////
    // MARK: - Initializers
    ////////////////////////////////////////////////////////////

    init(slug: String, location: String, address: String)
    {
        self.id = nil
        self.slug = slug
        self.location = location
        self.address = address
    }
}

////////////////////////////////////////////////////////////
// MARK: - Model
////////////////////////////////////////////////////////////

extension Station : Model
{
    init(node: Node, in context: Context) throws
    {
        self.id         = try node.extract("id")
        self.slug       = try node.extract("slug")
        self.location   = try node.extract("location")
        self.address    = try node.extract("address")
    }

    ////////////////////////////////////////////////////////////

    func makeNode(context: Context) throws -> Node
    {
        return try Node(node:
            [
                "id"        : self.id,
                "slug"      : self.slug,
                "location"  : self.location,
                "address"   : self.address
            ])
    }

    ////////////////////////////////////////////////////////////

    static func prepare(_ database: Database) throws
    {
        try database.create("stations")
        { stations in
            stations.id()
            stations.string("slug")
            stations.string("location")
            stations.string("address")
        }
    }

    ////////////////////////////////////////////////////////////

    static func revert(_ database: Database) throws
    {
        try database.delete("stations")
    }
}

////////////////////////////////////////////////////////////
// MARK: - Helpers
////////////////////////////////////////////////////////////

extension Station
{
    func trains() throws -> [Train]
    {
        let trains: Siblings<Train> = try siblings()
        return try trains.all()
    }
}
