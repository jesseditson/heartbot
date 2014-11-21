# Show deployed revisions

urls = {
  "site": "http://weheartit.com/info/revision",
  "meat": "http://upload.weheartit.com/info/revision",
}

module.exports = (robot) ->
  robot.respond /(\w+)* ?deployed (version|commit|revision)/i, (msg) ->
    app = msg.match[1] || "site"
    msg.http(urls[app]).get() (err, res, body) ->
      msg.send "#{app} deployed commit is #{body}"
