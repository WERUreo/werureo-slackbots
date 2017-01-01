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
    var fields: [AttachmentsField]?
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

    ////////////////////////////////////////////////////////////
    
    init(fallback: String?,
         color: String?,
         pretext: String?,
         authorName: String?,
         authorLink: String?,
         authorIcon: String?,
         title: String?,
         titleLink: String?,
         text: String?,
         fields: [AttachmentsField]?,
         imageURL: String?,
         thumbURL: String?,
         footer: String?,
         footerIcon: String?,
         ts: UInt64?,
         markdown: [String]?)
    {
        self.fallback = fallback
        self.color = color
        self.pretext = pretext
        self.authorName = authorName
        self.authorLink = authorLink
        self.authorIcon = authorIcon
        self.title = title
        self.titleLink = titleLink
        self.text = text
        self.fields = fields
        self.imageURL = imageURL
        self.thumbURL = thumbURL
        self.footer = footer
        self.footerIcon = footerIcon
        self.ts = ts
        self.markdown = markdown
    }
}

////////////////////////////////////////////////////////////
// MARK: - NodeRepresentable
////////////////////////////////////////////////////////////

extension Attachment : NodeRepresentable
{
    func makeNode(context: Context) throws -> Node
    {
        var attachments = [String : NodeRepresentable]()
        if let fallback = self.fallback     { attachments["fallback"] = fallback }
        if let color = self.color           { attachments["color"] = color }
        if let pretext = self.pretext       { attachments["pretext"] = pretext }
        if let authorName = self.authorName { attachments["author_name"] = authorName }
        if let authorLink = self.authorLink { attachments["author_link"] = authorLink }
        if let authorIcon = self.authorIcon { attachments["author_icon"] = authorIcon }
        if let title = self.title           { attachments["title"] = title }
        if let titleLink = self.titleLink   { attachments["title_link"] = titleLink }
        if let text = self.text             { attachments["text"] = text }
        if let fields = self.fields         { attachments["fields"] = try fields.makeNode() }
        if let imageURL = self.imageURL     { attachments["image_url"] = imageURL }
        if let thumbURL = self.thumbURL     { attachments["thumb_url"] = thumbURL }
        if let footer = self.footer         { attachments["footer"] = footer }
        if let footerIcon = self.footerIcon { attachments["footer_icon"] = footerIcon }
        if let ts = self.ts                 { attachments["ts"] = ts }
        if let markdown = self.markdown     { attachments["mrkdwn_in"] = try markdown.makeNode() }

        return try Node(node: attachments)
    }
}
