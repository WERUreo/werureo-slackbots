//
//  AttachmentField.swift
//  slack-commands
//
//  Created by Keli'i Martin on 11/23/16.
//
//

import Node

struct AttachmentField
{
    ////////////////////////////////////////////////////////////
    // MARK: - Properties
    ////////////////////////////////////////////////////////////

    var title: String
    var value: String
    var isShort: Bool = false

    ////////////////////////////////////////////////////////////
    // MARK: - Initializers
    ////////////////////////////////////////////////////////////

    init(title: String, value: String, isShort: Bool)
    {
        self.title = title
        self.value = value
        self.isShort = isShort
    }
}

////////////////////////////////////////////////////////////
// MARK: - NodeRepresentable
////////////////////////////////////////////////////////////

extension AttachmentField : NodeRepresentable
{
    func makeNode(context: Context) throws -> Node
    {
        return try Node(node:
            [
                "title" : self.title,
                "value" : self.value,
                "short" : self.isShort
            ])
    }
}
