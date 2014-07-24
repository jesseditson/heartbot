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

silly = require '../lib/silly'

module.exports = (robot) ->

  robot.respond /confetti\s?(bomb)?\s?(me)?(\d+)?/i, (msg) ->
    silly msg
    count = msg.match[3] || 5
    getImages msg, count, "confetti", (url) ->
      msg.send url

getImages = (msg, count, query, current, cb) ->
  if typeof current == 'function'
    cb = current
    current = []
  if current.length < count
    safe = 'active'
    q = v: '1.0', rsz: '8', q: query, safe: safe, start: Math.floor(Math.random() * 10)

    msg.http('http://ajax.googleapis.com/ajax/services/search/images')
      .query(q)
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.responseData?.results
        if images?.length > 0
          image  = msg.random images
          url = "#{image.unescapedUrl}#.png"
          if !~current.indexOf url
            current.push url
            cb url
          getImages msg, count, query, current, cb
        else
          setTimeout getImages.bind(null, msg, count, query, current, cb), 400
