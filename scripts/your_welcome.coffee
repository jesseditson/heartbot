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

module.exports = (robot) ->
  robot.hear /.*\s?(thank(s| you)|th?a?n?ks)([^\w]|$)/i, (msg) ->
    msg.send msg.random welcome
