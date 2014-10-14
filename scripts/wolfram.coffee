silly = require '../lib/silly'
matchLast = require '../lib/matchLast'
Wolfram = require('wolfram-alpha').createClient(process.env.HUBOT_WOLFRAM_APPID)

lookup_messages = [
  "looking that up...",
  "figuring that out...",
  "trying to find out.",
  "on it.",
  "gimme a sec",
  "I'll check that out.",
  "one second.",
  "I'll see.",
  "Oh, you couldn't google that?",
  "ok, I'll check.",
  "wait a minute and I'll find out."
]

module.exports = (robot) ->
  matchLast robot, (msg) ->
    silly msg, true
    # msg.send msg.random lookup_messages
    Wolfram.query msg.match[1] + msg.match[2], (e, result) ->
      if result and result.length > 0
        msg.send result[1]['subpods'][0]['text']
      # else
      #   msg.send "I don't know."
