# confettibomb / confetti bomb (me) N - gets N confetti images

# Description:
#   Confetti bomb. Basically ^K for campfire.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   confettibomb / confetti bomb (me) N - gets N confetti images

module.exports = (robot) ->

  robot.respond /confetti\s?(bomb)?\s?(me)?(\d+)?/i, (msg) ->
    count = msg.match[3] || 5
    for i in [0..count] by 1
      getImage msg, "confetti", (url) ->
        msg.send url

getImage = (msg, query, cb) ->
  safe = 'active'
  q = v: '1.0', rsz: '8', q: query, safe: safe
  
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"