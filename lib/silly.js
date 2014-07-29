var seriousRooms = (process.env.HUBOT_SERIOUS_ROOMS || '').split(',');

module.exports = function(msg){
  var originalSend = msg.send;
  msg.send = function(){
    var roomIsSerious = !!~seriousRooms.indexOf(this.message.room.toString());
    console.log('received message in', this.message.room,'checking if in',seriousRooms,':',roomIsSerious)
    if(roomIsSerious){
      console.log('intercepted message : ' + Array.prototype.slice.call(arguments).join(',') + ', not silly enough.');
    } else {
      return originalSend.apply(this,arguments);
    }
  }
  return msg;
}
