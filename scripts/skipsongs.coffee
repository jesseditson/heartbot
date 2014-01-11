# Skip this song
# skip this song

# Description:
#   Uses Jesse Ditson's remote-skip app to skip songs playing on local computers
#   https://github.com/jesseditson/remote-skip
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   Skip this song

pattern = /skip (this )?song/i

module.exports = (robot) ->
  
  robot.hear pattern, (msg) ->
    skipSong(msg)
    
  robot.respond /(skip.*)/i, (msg) ->
    console.log(msg)
    unless pattern.test(msg.match[1])
      skipSong(msg)
    
skipSong = (msg) ->
  username = msg.message.user.name
  url = 'http://skipsong.herokuapp.com/skip?user=' + username
  msg.http(url).get() (err,res,body) ->
    if /skipped/.test(body)
      msg.send "ok " + username + ", song skipped."
    else
      msg.send "Sorry " + username + ", your skip request was denied."