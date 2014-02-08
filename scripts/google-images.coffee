# Description:
#   A way to interact with the Google Images API.
#
# Commands:
#   hubot image me <query> - The Original. Queries Google Images for <query> and returns a random top result.
#   hubot animate me <query> - The same thing as `image me`, except adds a few parameters to try to return an animated GIF instead.
#   hubot mustache me <url> - Adds a mustache to the specified URL.
#   hubot mustache me <query> - Searches Google Images for the specified query and mustaches it.

pornMode = false

module.exports = (robot) ->
  # load safe search:
  robot.brain.data.pornmode = { engaged : pornMode }
  robot.brain.on 'loaded', (data) =>
    pornMode = robot.brain.data.pornmode && robot.brain.data.pornmode.engaged || pornMode
    
  robot.hear /.*(engage\s?)?(porn\s?mode|safe\s?search)\s?(on|off)?/i, (msg) ->
    if msg.match[3] || msg.match[1]
      toggle = if (msg.match[3] == 'on' || msg.match[1] == 'engage') then true else false
      robot.brain.data.pornmode = (typeof robot.brain.data.pornmode == 'object' ) && robot.brain.data.pornmode || {}
      robot.brain.data.pornmode.engaged = toggle
      console.log(robot.brain.data.pornmode)
    else 
      toggle = robot.brain.data.pornmode.engaged
    console.log(robot.brain.data.pornmode)
    state = if toggle then 'ENGAGED' else 'DISENGAGED'
    msg.send "PORN MODE " + state + "."
  
  robot.respond /(image|img)( me)? (.*)/i, (msg) ->
    imageMe msg, msg.match[3], (url) ->
      msg.send url
      debugPrint(url)

  robot.respond /animate( me)? (.*)/i, (msg) ->
    imageMe msg, msg.match[2], true, (url) ->
      msg.send url
      debugPrint(url)

debugPrint = (url) ->
  if process.env.DEBUG
    pictureTube = require('picture-tube')()
    spawn = require('child_process').spawn
    request = require('request')
    
    imgUrl = url.replace(/#.+$/,'')
    console.log imgUrl
    convert = spawn('convert', ['-', '-thumbnail', '50x50' + '^', '-gravity', 'center', '-extent', '50x50', 'png:-'])
    pictureTube.pipe(process.stdout)
    request.get(imgUrl).pipe(convert.stdin)
    convert.stdout.pipe(pictureTube)

  # robot.respond /(?:mo?u)?sta(?:s|c)he?(?: me)? (.*)/i, (msg) ->
#     type = Math.floor(Math.random() * 3)
#     mustachify = "http://mustachify.me/#{type}?src="
#     imagery = msg.match[1]
# 
#     if imagery.match /^https?:\/\//i
#       msg.send "#{mustachify}#{imagery}"
#     else
#       imageMe msg, imagery, false, true, (url) ->
#         msg.send "#{mustachify}#{url}"

imageMe = (msg, query, animated, faces, cb) ->
  cb = animated if typeof animated == 'function'
  cb = faces if typeof faces == 'function'
  safe = if pornMode then 'off' else 'active'
  q = v: '1.0', rsz: '8', q: query, safe: safe
  q.imgtype = 'animated' if typeof animated is 'boolean' and animated is true
  q.imgtype = 'face' if typeof faces is 'boolean' and faces is true
  console.log(q)
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"

