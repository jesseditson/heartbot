silly = require '../lib/silly'
matchLast = require '../lib/matchLast'
Wolfram = require('wolfram-alpha').createClient(process.env.HUBOT_WOLFRAM_APPID)

module.exports = (robot) ->
  matchLast robot, (msg) ->
    silly msg, true
    Wolfram.query msg.match[1], (e, result) ->
      if result and result.length > 0
        msg.send result[1]['subpods'][0]['text']
      else
        msg.send "I don't know."
