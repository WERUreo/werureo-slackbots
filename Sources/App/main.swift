import Vapor

let drop = Droplet()

// Alright, alright, alright
drop.get("alright")
{ request in
    let attachments = try JSON(node:
        [
            "image_url": "https://s3.amazonaws.com/werureo-random/hurricane_matthew.png"
        ])

    let payload = try JSON(node:
        [
            "response_type": "in_channel",
            "attachments": JSON([attachments])
        ])
    
    return payload
}

drop.run()
