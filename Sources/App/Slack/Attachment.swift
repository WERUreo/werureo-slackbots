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
    ////////////////////////////////////////////////////////////
    // MARK: - Properties
    ////////////////////////////////////////////////////////////

    var fallback: String?
    var color: String?
    var pretext: String?
    var authorName: String?
    var authorLink: String?
    var authorIcon: String?
    var title: String?
    var titleLink: String?
    var text: String?
    var fields: [AttachmentField]?
    var imageURL: String?
    var thumbURL: String?
    var footer: String?
    var footerIcon: String?
    var ts: UInt64?
    var markdown: [String]?

    ////////////////////////////////////////////////////////////
    // MARK: - Initializers
    ////////////////////////////////////////////////////////////

    init()
    {
        // this empty initializer is provided in the case you don't want to include all parameters when initializing
    }
}

////////////////////////////////////////////////////////////
// MARK: - NodeRepresentable
////////////////////////////////////////////////////////////

extension Attachment : NodeRepresentable
{
    func makeNode(context: Context) throws -> Node
    {
        var attachment = [String : NodeRepresentable]()
        if let fallback = self.fallback     { attachment["fallback"] = fallback }
        if let color = self.color           { attachment["color"] = color }
        if let pretext = self.pretext       { attachment["pretext"] = pretext }
        if let authorName = self.authorName { attachment["author_name"] = authorName }
        if let authorLink = self.authorLink { attachment["author_link"] = authorLink }
        if let authorIcon = self.authorIcon { attachment["author_icon"] = authorIcon }
        if let title = self.title           { attachment["title"] = title }
        if let titleLink = self.titleLink   { attachment["title_link"] = titleLink }
        if let text = self.text             { attachment["text"] = text }
        if let fields = self.fields         { attachment["fields"] = try fields.makeNode() }
        if let imageURL = self.imageURL     { attachment["image_url"] = imageURL }
        if let thumbURL = self.thumbURL     { attachment["thumb_url"] = thumbURL }
        if let footer = self.footer         { attachment["footer"] = footer }
        if let footerIcon = self.footerIcon { attachment["footer_icon"] = footerIcon }
        if let ts = self.ts                 { attachment["ts"] = ts }
        if let markdown = self.markdown     { attachment["mrkdwn_in"] = try markdown.makeNode() }

        return try Node(node: attachment)
    }
}
