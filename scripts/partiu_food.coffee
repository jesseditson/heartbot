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

foodPlaces =
  'SFO': [
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
    "Mexican Place next to the Stockton Tunnel",
    "Any BOMBA! PLACE!"
  ]

  'MDE': [
    "Sushi Market",
    "Sushi To Go",
    "Piccolo",
    "Barbacoa",
    "El Corral",
    "Leños & Carbón",
    "So Happy",
    "Carulla",
    "Oviedo",
    "Presto",
    "Subway",
    "La Strada",
    "Archie's",
    "Nino e Pastino",
    "Fellini",
    "Il Forno"
    "Burger King"
  ]

foodCities = ['SFO', 'MDE']

module.exports = (robot) ->
  # load food places from brain:
  robot.brain.data.partiuFood =
    cities: foodCities
    places : foodPlaces
    pictures : {}

  robot.brain.on 'loaded', (data) =>
    robot.brain.data.partiuFood.pictures = robot.brain.data.partiuFood.pictures || {}
    robot.brain.data.partiuFood.cities = robot.brain.data.partiuFood.cities || foodCities

    for city in data.partiuFood.cities then do (city) ->
      for place in data.partiuFood.places[city] then do (place) ->
        foodPlaces[city].push(place)

  robot.respond /.*(add|remember) city (.+)/i, (msg) ->
    city = msg.match[3]
    robot.brain.data.partiuFood.cities.push(city)
    msg.send "Ok, I'll remember they city #{city}."

  robot.respond /.*all food (places|restaurants)? in (.+)?/i, (msg) ->
    city = msg.match[2]
    city ||= 'SFO'
    msg.send robot.brain.data.partiuFood.places[city].join(", ")

  robot.respond /.*(add|remember) (food|place|restaurant) (.+) in (.+)?/i, (msg) ->
    place = msg.match[3]
    city = msg.match[4]
    city ||= 'SFO'
    robot.brain.data.partiuFood.places[city].push(place)
    msg.send "Ok, I'll remember #{place} in #{city}."

  robot.respond /.*(add|remember) (picture|photo|image)(\s?for)?(\s?food|place|restaurant)? (.+) (.+)/i, (msg) ->
    place = msg.match[5]
    pic = msg.match[6]
    for city in robot.brain.data.partiuFood.cities then do (city) ->
      if (robot.brain.data.partiuFood.places[city].indexOf place) isnt -1
        pictures = robot.brain.data.partiuFood.pictures[place] || []
        pictures.push(pic)
        robot.brain.data.partiuFood.pictures[place] = pictures
        return msg.send "Ok, I added that picture to #{place}."

    msg.send "I don't know about the place '#{place}'"

  robot.respond /.*(forget|remove) (food|place|restaurant) (.+) in (.+)/i, (msg) ->
    findplace = msg.match[3]
    city = msg.match[4]
    city ||= 'SFO'
    robot.brain.data.partiuFood.places[city] = robot.brain.data.partiuFood.places[city].filter (place) ->
      place isnt findplace
    delete robot.brain.data.partiuFood.pictures[findplace]
    msg.send "Ok, I've removed " + findplace + "."

  robot.respond /.*(partiu|fucking random|where).*?(is|should we go (for)?)? (food|lunch)( in (.+))?.*/i, (msg) ->
    city = msg.match[6]
    city ||= 'SFO'
    prefix = msg.random(goToFucking)
    suffix = msg.random(robot.brain.data.partiuFood.places[city]) unless prefix.match("drinking")
    suffix ||= ""
    pictures = robot.brain.data.partiuFood.pictures[suffix]
    picture = " "
    if pictures and pictures.length
      picture += pictures[Math.floor(Math.random() * pictures.length)]
    msg.send prefix + suffix + picture
