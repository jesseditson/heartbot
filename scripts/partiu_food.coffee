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
  "Stop asking me this shit and just go to ",
  "I'm getting tired of this, just go to ",
  "FOOD! ME HUNGRY! go to and bring me something back from fucking ",
  "Don't fuck me, be a man and go drinking instead!",
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
  # load food places from brain:
  robot.brain.data.partiuFood = { places : foodPlaces, pictures : {} }
  robot.brain.on 'loaded', (data) =>
    robot.brain.data.partiuFood.pictures = robot.brain.data.partiuFood.pictures || {}
    for place in data.partiuFood.places then do (place) ->
      foodPlaces.push(place)

  robot.respond /.*(add|remember) (food|place|restaurant) (.+)/i, (msg) ->
    place = msg.match[3]
    robot.brain.data.partiuFood.places.push(place)
    msg.send "Ok, I'll remember " + place + "."

  robot.respond /.*(add|remember) (picture|photo|image)(\s?for)?(\s?food|place|restaurant)? (.+) (.+)/i, (msg) ->
    place=msg.match[5]
    pic=msg.match[6]
    if (robot.brain.data.partiuFood.places.indexOf place) is -1 then return msg.send "I don't know about the place '"+place+"'"
    pictures = robot.brain.data.partiuFood.pictures[place] || []
    pictures.push(pic)
    robot.brain.data.partiuFood.pictures[place] = pictures
    msg.send "Ok, I added that picture to "+ place + "."

  robot.respond /.*(forget|remove) (food|place|restaurant) (.+)/i, (msg) ->
    findplace = msg.match[3]
    robot.brain.data.partiuFood.places = robot.brain.data.partiuFood.places.filter (place) ->
      place isnt findplace
    delete robot.brain.data.partiuFood.pictures[findplace]
    msg.send "Ok, I've removed " + findplace + "."

  robot.respond /.*(partiu|fucking random|where).*?(is|should we go (for)?)? (food|lunch).*/i, (msg) ->
    prefix = msg.random(goToFucking)
    suffix = msg.random(foodPlaces) unless prefix.match("drinking")
    suffix ||= ""
    pictures = robot.brain.data.partiuFood.pictures[suffix]
    picture = " "
    if pictures and pictures.length
      picture += pictures[Math.floor(Math.random() * pictures.length)]
    msg.send prefix+suffix+picture
