# snowflame
# snowflame <url> or snowflame <term> - puts snowflame on things.

# Description:
#   Adds snowflame to things.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   snowflame <url> - puts snowflame on an image
#   snowflame <term> - searches for a term and puts snowflame on it.

module.exports = (robot) ->

  robot.respond /log( me)? (.*)/i, (msg) ->
    term = msg.match[2]
    host = "http://snowflamer.herokuapp.com/log/"
    if /^http/.test(term)
      msg.send host + encodeURIComponent(term) + "#.png"
    else
      imageMe msg, term, (url) ->
        msg.send host + encodeURIComponent(url) + "#.png"

imageMe = (msg, query, cb) ->
  q = v: '1.0', rsz: '8', q: query, safe: 'off'
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}"
