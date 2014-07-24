// Description:
//   Shit DHH says.
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   dhh - shit dhh says
//
// Author:
//   Jesse Ditson (@jesseditson)

var Twit = require('twit')

var T = new Twit({
    consumer_key:         'sPYUcnVdBaimViT0qr2y6bVIF'
  , consumer_secret:      'uIGmzIpdi0t47khZoDDBKQPeF9so3KoosesgZhPXpXRJbSM5sa'
  , access_token:         '98531887-fVsmIZSLbcmrmbhSioypvu2Al0Vn5nn1Ib7kajutr'
  , access_token_secret:  'YrS218tq1jr27XBaUzFiJ0AGwYKhb5L5nM57yESFTJvFS'
})

var username = 'shitdhhsays';

var tweets = function(cb){
  T.get('statuses/user_timeline', { screen_name: username, count: 100 }, function(err, data, response) {
    var tweets = data || [];
    cb(err,tweets.map(function(tweet){
      return 'https://twitter.com/' + username + '/status/' + tweet.id_str;
    }));
  });
}

var sendTweet = function(msg){
  tweets(function(err,tweets){
    if(err) return msg.send('error: ',err.message);
    msg.send(msg.random(tweets));
  });
}

module.exports = function(robot){
  robot.respond(/dhh/i,sendTweet);
  robot.hear(/rails.*FAIL/i,sendTweet);
}
