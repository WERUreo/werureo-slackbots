//
//  HTTPClient+Something.swift
//  slack-commands
//
//  Created by Keli'i Martin on 12/5/16.
//
//

import TLS
import Transport

func setupClient()
{
    defaultClientConfig =
    {
        return try TLS.Config(context: try Context(mode: .client), certificates: .none, verifyHost: false, verifyCertificates: false, cipher: .compat)
    }
}
