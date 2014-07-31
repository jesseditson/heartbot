

var Cleverbot = require('cleverbot-node')
var silly = require('../lib/silly')
var matchLast = require('../lib/matchLast')

module.exports = function(robot) {
  var cleverbot = new Cleverbot();
  matchLast(robot,function(msg){
    silly(msg)
    cleverbot.write(msg.match[1], function(a){
      msg.send(a.message);
    });
  });
};
