# Description
#   Heartbot will choose where to go for lunch!
#
# Commands:
#   heartbot partiu food - Returns a random restaurant from the list of our favorite ones.
#   heartbot fucking random food - Returns a random restaurant from the list of our favorite ones.

goToFucking = [
  "What's that question? go to fucking ",
  "Go to fucking ",
  "I think you're hungry, go to ",
  "Starving? go to ",
  "Stop asking me this shit and go just go to ",
  "I'm getting tired of this, just go to ",
  "FOOD! ME HUNGRY! go to and bring me something back from fucking ",
  "Don't fuck me, be a man go drinking instead!",
]

foodPlaces = [
  "Bolo de queijo. aka Cheesecake Factory",
  "Lori's Dinner",
  "Super Dupper",
  "La Boulange",
  "Osha!",
  "Steak!",
  "Cuban",
  "Pomodoro",
  "French. The one with French Pizza",
  "Sushirrito",
  "off the grid",
  "Indian street food burrito",
  "Mixed Greens",
  "Akiko's Sushi Bar",
  "Uncle Vito's Pizza",
  "El Sotano",
  "Mexican Place next to the Stockton Tunnel"
  "Any BOMBA! PLACE!"
]

module.exports = (robot) ->
  robot.respond /.*(partiu|fucking random|where)?.*?(is|should we go (for)?)? (food|lunch).*/i, (msg) ->
    prefix = msg.random(goToFucking)
    suffix = msg.random(foodPlaces) unless prefix.match("drinking")
    suffix ||= ""
    msg.send prefix+suffix
