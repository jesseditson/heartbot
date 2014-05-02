# Description: 
#   Bombs with emoji
#
# Commands:
#   hubot :trollface: bomb
#   hubot :trollface: bomb 2000
#

emojimap = {
  ":trollface:" : /^troll/,
  ":heart: :yellow_heart: :green_heart: :blue_heart: :purple_heart:" : /^(heart|rainbow)/
}

module.exports = (robot) ->
  robot.hear /([^\s]+)\s*bomb\s*(\d+)?/i, (msg) ->
    bombthing = msg.match[1]
    num = parseInt msg.match[2], 10
    num = 200 if isNaN num
    num = Math.min num, 999999
    matched = false
    for emoji, regex of emojimap
      if regex.test bombthing
        bombthing = emoji
        matched = true
        break
    isEmoji = /^\:[^\:]+\:$/.test bombthing
    if !matched && !isEmoji
      bombthing = ':' + bombthing + ':'
    str = ""
    for n in [1...num] by 1
      str += bombthing + " "
    msg.send str