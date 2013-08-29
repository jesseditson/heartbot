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

  robot.respond /(snowflame)( me)? (.*)/i, (msg) ->
    term = msg.match[3]
    if /^http/.test(term)
      msg.send "http://snowflamer.herokuapp.com/" + encodeURIComponent(term) + "#.png"
    else
      imageMe msg, term, (url) ->
        msg.send "http://snowflamer.herokuapp.com/" + encodeURIComponent(url) + "#.png"

imageMe = (msg, query, cb) ->
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}"
