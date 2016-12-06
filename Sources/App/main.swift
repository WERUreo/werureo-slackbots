import Vapor
import TLS

setupClient()

let drop = Droplet()

let slack = SlackController(drop: drop)

// Alright, alright, alright
drop.get("alright", handler: slack.alright)

// Realm Status
drop.post("realmstatus", handler: slack.realmstatus)

// NASA's Astronomy Photo of the Day
drop.get("apod", handler: slack.apod)

// Tabs on Tallahassee Bills
drop.get("tabsontally", handler: slack.tabsOnTally)

// Overwatch API
drop.post("overwatch", handler: slack.overwatch)

drop.run()
