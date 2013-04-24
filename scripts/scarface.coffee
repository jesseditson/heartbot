# Makes hubot act as Tony Montana.
#
# anything containing <tony|scarface|montana> - Displays a Tony's quote.
#
tonyQuotes = [
  "You don't got nothing to do with your life. Why don't you get a job? Work with lepers. Blind kids. Anything's gotta be better than lying around all day waiting for me to fuck you.",
  "What you lookin' at? You all a bunch of fuckin' assholes.",
  "You need people like me. You need people like me so you can point your fuckin' fingers and say, \"That's the bad guy.\" So... what that make you? Good? You're not good.",
  "Me, I always tell the truth. Even when I lie.",
  "In this country, you gotta make the money first. Then when you get the money, you get the power. Then when you get the power, then you get the women. ",
  "Who put this thing together? Me, that's who! Who do I trust? Me!",
  "I'm Tony Montana! You fuck with me, you fuckin' with the best!",
  "All I have in this world is my balls and my word and I don't break them for no one. Do you understand?",
  "You know what capitalism is? Getting fucked!",
  "This is paradise, I'm tellin' ya. This town like a great big pussy just waiting to get fucked.",
  "I ain't gonna kill you ...  Manolo, shoot that piece of shit!",
  "NOW you're talking to me, Baby",
  "Me, dance? Hey, I think I wanna have a heart attack.",
  "The only thing in this world that gives orders... is balls.",
  "Fuck You!",
  "You a communist? Huh? How'd you like it, man? They tell you all the time what to do, what to think, what to feel. Do you wanna be like a sheep? Like all those other people? Baah! Baah!",
  "You wanna fuck with me? Okay. You wanna play rough? Okay. Say hello to my little friend!"
]

module.exports = (robot) ->
  robot.respond /.*(tony|scarface|montana).*/i, (msg) ->
    msg.send msg.random tonyQuotes
