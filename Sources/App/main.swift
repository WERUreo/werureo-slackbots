import Vapor

let drop = Droplet()

let slack = SlackController()

// Alright, alright, alright
drop.get("alright", handler: slack.alright)

drop.run()
