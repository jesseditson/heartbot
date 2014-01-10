# What's Jesse listening to?
# what is Jesse listening to?

# Description:
#   Tells you what song Jesse is listening to
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   what's/what is Jesse listening to?
#   what song is this?

pattern = /what(('s| is) jesse listening to| song is this| is this song)\??/i

module.exports = (robot) ->
  robot.hear pattern, (msg) ->
    respondWithTrackName(msg)
  robot.respond pattern, (msg) ->
    respondWithTrackName(msg)
    
respondWithTrackName = (msg) ->
  url = 'http://www.last.fm/user/Synnister/now'
  msg.http(url).get() (err,res,body) ->
    infoMatch = body.match(/data-page-title.+?>([^<]+)/i)
    if infoMatch
      info = infoMatch[1].replace(" (now playing) - Last.fm","")
      msg.send "Jesse is listening to #{info}"
    else
      msg.send "Jesse doesn't seem to be listening to music right now."