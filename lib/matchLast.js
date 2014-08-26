module.exports = function(robot,fn){
  var r = new RegExp("(?:^" + robot.alias + "|" + robot.name + ")\s*(.*)", "i")
  robot.hear(r,function(msg){
    matches = msg.message.text.match(r)
    if(matches && matches.length > 1){
      var responded = this.robot.listeners.some(function(l, i){
        var regex = l.regex;
        // console.log(regex.test(msg.message.text), msg.message.text, regex, ', regex:',/^\/\(?\.(\+|\*)\??\)?\/$/.test(regex.toString()), 'last : ',regex.toString() == r.toString(), l);
        if(/^\/\(?\.(\+|\*)\??\)?\/$/.test(regex.toString()) || regex.toString() == r.toString()){
          // don't care about other catchalls (or ourselves)
          return false;
        }
        return regex.test(msg.message.text);
      });
      if(!responded){
        fn.apply(this,arguments);
      }
    }
  })
}
