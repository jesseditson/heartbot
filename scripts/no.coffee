# Description
#   Sends a no quote or gif everytime someone mentions no, nope, nah.

noQuotes = [
  "ABSOLUTAMENTE NO!",
  "NO NO NO NO NO NO NO NO!!! ABOSOLUTAMENTE NO!",
  "https://d16jfyletng9p5.cloudfront.net/media/njYrp176NQsHS/giphy.gif",
  "http://troll.me/images/angry-samuel-l-jackson/oh-hell-no.jpg"
]

module.exports = (robot) ->
  robot.hear /^(NO|nope|nay|nah)$/, (msg) ->
    msg.send msg.random noQuotes
