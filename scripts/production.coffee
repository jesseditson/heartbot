# Test in production

# Description:
#   Test in production memes.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   'test' - when heartbot hears 'test', it shows an image about testing in production.

silly = require '../lib/silly'

images = [
  "http://assets.diylol.com/hfs/033/22b/769/resized/the-most-interesting-man-in-the-world-meme-generator-i-don-t-always-test-my-code-but-when-i-do-i-do-it-in-production-b3ead1.jpg",
  "http://www.troll.me/images/chuck-norris/testing-is-for-wimps-real-men-test-in-production.jpg",
  "http://www.quickmeme.com/img/22/228c7e9afc0352e0b7a890e3f358afebfe2882c37efacae7ab8bc551468afbf4.jpg",
  "http://www.quickmeme.com/img/59/595e5766502e10e8cd9bc51602deb2fbeb9a6d2440017146452db9b7a19c6e42.jpg",
  "http://zeroturnaround.com/wp-content/uploads/2014/03/Screen-Shot-2013-07-17-at-12.05.27-PM.png",
  "http://www.troll.me/images/disaster-girl/test-in-production-be-my-guest.jpg",
  "http://www.quickmeme.com/img/e4/e445dde0e70a52ad63362cb6bd62413a62ce2d3d4f277dcda3f55ff0e376d54f.jpg",
  "http://www.quickmeme.com/img/8b/8b5baf61a01f149abe12d7b416fca70de852b0ddfbab5047eb70eb971ea5b024.jpg",
  "http://cdn.memegenerator.net/instances/250x250/52693310.jpg",
  "http://cdn.memegenerator.net/instances/500x/43272873.jpg",
  "http://cdn.memegenerator.net/instances/250x250/52310597.jpg",
  "http://cdn.memegenerator.net/instances/400x/27022495.jpg",
  "http://cdn.memegenerator.net/instances/500x/44993665.jpg",
  "http://smugsorcery.files.wordpress.com/2013/12/meme-bugs-1.jpg",
  "http://www.quickmeme.com/img/e1/e1f36fc6eb97ce44352e521ae7fffefbbd3ae1ff8561419f46c29c48bc5d62ec.jpg"
]

module.exports = (robot) ->
  robot.hear /(test|production|staging)/i, (msg) ->
    silly msg
    msg.send msg.random images
    msg.done = true
