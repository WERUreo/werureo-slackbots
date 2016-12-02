//
//  Bill.swift
//  slack-commands
//
//  Created by Keli'i Martin on 12/2/16.
//
//

import Foundation
import Vapor
import Fluent

struct Bill : Model
{
    ////////////////////////////////////////////////////////////
    // MARK: - Properties
    ////////////////////////////////////////////////////////////

    var id: Node?
    var type: String = "Bill"
    var attributes: [String: String]?
    var createdAt: Date?
    var updatedAt: Date?
    var identifier: String?
    var title: String?
    var classification: [String]?
    var subject: [String]?

    ////////////////////////////////////////////////////////////
    // MARK: - Initializers
    ////////////////////////////////////////////////////////////

    init(node: Node, in context: Context) throws
    {
//        self.id = try node.extract("id")
//        self.type = try node.extract("type")
//        self.attributes = try node.extract("attributes")
//        self.createdAt = try node.extract("createdAt")
//        self
    }

    ////////////////////////////////////////////////////////////
    // MARK: - NodeRepresentable
    ////////////////////////////////////////////////////////////

    func makeNode(context: Context) throws -> Node
    {
        // TODO
        return "TODO"
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Preparation
    ////////////////////////////////////////////////////////////

    static func prepare(_ database: Database) throws
    {
        // TODO
    }

    ////////////////////////////////////////////////////////////

    static func revert(_ database: Database) throws
    {
        // TODO
    }
}
