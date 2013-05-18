// Description:
//   Translates the last thing said using google translate ajax apis.
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   translate (that) - automatically translates the last thing said to english.
//   translate (person) - automatically translates the last thing a person said to english.
//   english (please) - same as above
//
// Author:
//   Jesse Ditson (@jesseditson)

var translate = function(robot,text,callback){
  robot.http("https://translate.google.com/translate_a/t")
    .query({
      client: 't',
      hl: 'en',
      multires: 1,
      ie: 'UTF-8',
      oe: 'UTF-8',
      oc: 1,
      otf: 2,
      sc: 1,
      sl: 'auto',
      ssel: 3,
      alttl: 'es',
      tl: 'en',
      tsel: 0,
      uptl: "en",
      q: text
    })
    .header('User-Agent', 'Mozilla/5.0')
    .get()(function(err,res,body){
      if(err) return callback(false)
      var data = body
      if(data.length > 4 && data[0] == '['){
        var parsed = eval(data)
        var language = parsed[2]
        if(language == 'en') return callback(false)
        parsed = parsed[0] && parsed[0][0] && parsed[0][0][0]
        if(!parsed) return callback(false)
        callback(parsed)
      }
    })
}

module.exports = function(robot){
  // set up storage
  robot.brain.data.lastSaid = {}
  robot.brain.on('loaded',function(data){
    // nothing to do here
  })
  robot.respond(/auto\s?translate (off|on)?/i,function(msg){
    var on = msg.match[1] == 'on' ? true : msg.match[1] == 'off' ? false : null
    if(on == null){
      robot.brain.data.autotranslate = !robot.brain.data.autotranslate
    } else if(on){
      robot.brain.data.autotranslate = true
    } else {
      robot.brain.data.autotranslate = false
    }
    msg.send("Auto Translate is now " + (robot.brain.data.autotranslate ? 'on' : 'off') + '.')
    if(robot.brain.data.autotranslate && robot.brain.data.lastSaid.all && robot.brain.data.lastSaid.all.length){
      var toTranslate = robot.brain.data.lastSaid.all.length
      var responses = []
      robot.brain.data.lastSaid.all.forEach(function(phrase){
        translate(robot,phrase,function(response){
          if(response) responses.push(phrase + " : " + response)
          if(--toTranslate == 0 && responses.length) msg.send("Recently said : \n " + responses.join("\n"))
        })
      })
    }
  })
  
  // store the things that people say
  robot.hear(/(.+)/,function(msg){
    var user = msg.message.user.name
    var messageText = msg.match[1]
    var all = robot.brain.data.lastSaid.all || []
    all.push(messageText)
    if(all.length > 20) all.unshift()
    robot.brain.data.lastSaid.all = all
    var lastSaid = robot.brain.data.lastSaid[user] || []
    lastSaid.push(messageText)
    if(lastSaid.length > 5) lastSaid.unshift()
    robot.brain.data.lastSaid[user] = lastSaid
    if(robot.brain.data.autotranslate){
      // automatically try to translate everything said if this is on
      translate(robot,messageText,function(response){
        if(response) msg.send("(" + response + ")")
      })
    }
  })
  
  // translate when asked
  robot.hear(/(translate|english) (.+)/i,function(msg){
    var action = msg.match[2]
    var num = (parseInt(msg.match[2].replace(/[^\d]+/g,''),10) || 1) + 1
    var phrases = []
    if(/(that|please|\d)/.test(action)){
      // translate the last thing said
      phrases.push(robot.brain.data.lastSaid.all.slice(-num,-1))
    } else {
      // try to find a user name in the text.
      Object.keys(robot.brain.data.lastSaid).forEach(function(user){
        // first name only matters
        var pat = new RegExp(user.replace(/(.+?)\s.+/,"$1"),'i')
        if(pat.test(action)){
          // found this user's name.
          phrases.push(robot.brain.data.lastSaid[user].slice(-num,-1))
        }
      })
    }
    phrases.forEach(function(phrase){
      translate(robot,phrase,function(response){
        if(response){
          msg.send(response)
        } else {
          msg.send(phrase + " is already in english.")
        }
      })
    })
  })
}