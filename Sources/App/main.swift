import Vapor
import VaporPostgreSQL

let drop = Droplet()
try drop.addProvider(VaporPostgreSQL.Provider)
drop.preparations += Train.self
drop.preparations += Station.self
drop.preparations += Schedule.self

let slack = SlackController(drop: drop)
slack.addRoutes()

let seatgeek = SeatGeekController(drop: drop)
seatgeek.addRoutes()

let weather = WeatherController(drop: drop)
weather.addRoutes()

let sunrail = SunRailController(drop: drop)
sunrail.addRoutes()

drop.run()
