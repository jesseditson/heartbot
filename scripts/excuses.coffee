# Description
#   Sends a programmer excuse everytime someone mentions excuses, blame, etc.

silly = require '../lib/silly'
Select     = require("soupselect").select
HTMLParser = require 'htmlparser'

module.exports = (robot) ->
  robot.hear /.*(excuse(|s)|blame|(complain*)|issue|compatibility|deadline).*/i, (msg) ->
    msg.http("http://www.programmerexcuses.com")
      .get() (error, response, body) ->
        msg.send parseHTML(body, "a")[0].children[0].raw

parseHTML = (html, selector) ->
  handler = new HTMLParser.DefaultHandler((() ->),
    ignoreWhitespace: true
  )
  parser  = new HTMLParser.Parser handler
  parser.parseComplete html

  Select handler.dom, selector
