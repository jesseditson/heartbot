# Makes heart bot more polite.
#
# says you're welcome when it should.
#

welcome = [
  "You're welcome!",
  "No problem!",
  "No prob.",
  "NP!",
  "No biggie!",
  "Anytime!",
  "You got it.",
  "Happy to help!",
  "Glad I could help."
]

angry = [
  "Fuck you too",
  "Yeah, you suck",
  "Fuck you",
  "Screw you"
]

module.exports = (robot) ->
  robot.hear /.*\s?(thank(s| you)|th?a?n?ks)([^\w]|$)/i, (msg) ->
    msg.send msg.random welcome

  robot.hear /.*(fuck|screw|stupid).*(heart\s*bot|HB)/i, (msg) ->
    if msg.match[1]
      anger msg
      
  robot.hear /.*(heart\s*bot|HB).*(fuck|screw|stupid|sucks|lame|dick|ass)/i, (msg) ->
    if msg.match[2]
      anger msg

anger = (msg) ->
  msg.send (msg.random angry) + ", " + msg.message.user.name