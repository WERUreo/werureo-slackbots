import Vapor

let drop = Droplet()

let slack = SlackController(drop: drop)

// Alright, alright, alright
drop.get("alright", handler: slack.alright)

// Realm Status
drop.post("realmstatus", handler: slack.realmstatus)

drop.run()
