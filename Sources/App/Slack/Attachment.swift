//
//  Attachment.swift
//  slack-commands
//
//  Created by Keli'i Martin on 12/10/16.
//
//

import Node

struct Attachment
{
    var fallback: String?
    var color: String?
    var pretext: String?
    var authorName: String?
    var authorLink: String?
    var authorIcon: String?
    var title: String?
    var titleLink: String?
    var text: String?
    var fields: [AttachmentsField]?
    var imageURL: String?
    var thumbURL: String?
    var footer: String?
    var footerIcon: String?
    var ts: UInt64?
}

extension Attachment : NodeRepresentable
{
    func makeNode(context: Context) throws -> Node
    {
        return Node(0)
    }
}
