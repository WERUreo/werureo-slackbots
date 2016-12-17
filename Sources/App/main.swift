import Vapor
import TLS

setupClient()

let drop = Droplet()

let slack = SlackController(drop: drop)
let seatgeek = SeatGeekController(drop: drop)

// Alright, alright, alright
drop.get("alright", handler: slack.alright)

// Realm Status
drop.post("realmstatus", handler: slack.realmstatus)

// NASA's Astronomy Photo of the Day
drop.get("apod", handler: slack.apod)

// Tabs on Tallahassee Bills
drop.post("tabsontally", handler: slack.tabsOnTally)

// Overwatch API
drop.post("overwatch", handler: slack.overwatch)

// Seat Geek API
drop.post("parking", handler: seatgeek.parking)

drop.run()
