//
//  SlackPayload.swift
//  slack-commands
//
//  Created by Keli'i Martin on 1/13/17.
//
//

import Node

struct SlackPayload
{
    enum ResponseType: String
    {
        case inChannel = "in_channel"
        case ephemeral = "ephemeral"
    }

    ////////////////////////////////////////////////////////////
    // MARK: - Properties
    ////////////////////////////////////////////////////////////

    var text: String?
    var attachments: [Attachment]?
    var responseType: ResponseType = .ephemeral
    var isMarkdownEnabled: Bool = true

    ////////////////////////////////////////////////////////////
    // MARK: - Initializers
    ////////////////////////////////////////////////////////////

    init(text: String? = nil, attachments: [Attachment]? = nil, responseType: ResponseType = .ephemeral, isMarkdownEnabled: Bool = true)
    {
        self.text = text
        self.attachments = attachments
        self.responseType = responseType
        self.isMarkdownEnabled = isMarkdownEnabled
    }
}

////////////////////////////////////////////////////////////
// MARK: - NodeRepresentable
////////////////////////////////////////////////////////////

extension SlackPayload : NodeRepresentable
{
    func makeNode(context: Context) throws -> Node
    {
        var payload = [String : NodeRepresentable]()
        if let text = self.text                 { payload["text"] = text }
        if let attachments = self.attachments   { payload["attachments"] = try attachments.makeNode() }
        payload["response_type"] = self.responseType.rawValue
        payload["mrkdwn"] = self.isMarkdownEnabled ? "true" : "false"

        return try Node(node: payload)
    }
}
