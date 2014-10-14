# Sends an image of the most interesting people in the world having meetings.
#
# trigger it with `product (people|guys)`
#
silly = require '../lib/silly'
interestingImages = [
  "http://image.shutterstock.com/display_pic_with_logo/463219/463219,1284343432,1/stock-photo-business-meeting-two-businessmen-in-suits-working-together-in-boardroom-60862144.jpg",
  "http://www.opusmeetingrooms.com/wp-content/uploads/2013/05/meeting-rooms-for-traveling-professionals.jpg",
  "http://meetmrholland.files.wordpress.com/2013/02/130203-blog-holland-creative-meeting-boring-meeting.jpg",
  "http://www.salzburg-parkhotel.com/wp-content/themes/salzburg/images/meeting-2.jpg",
  "http://theyec.org/wp-content/uploads/conduct-a-meeting.jpg",
  "http://christianschooljournal.com/wp-content/uploads/2013/07/Meeting-clapping-success-happy-productive.jpg",
  "http://onlinecareertips.com/wp-content/uploads/2012/10/managing-meetings.jpg",
  "http://www.tidanhotels.com/files/23/meetings-head.jpg",
  "http://www.projectormeetings.com/wp-content/uploads/2010/01/meeting1.jpg",
  "http://www.impactcommunicationsinc.com/wp-content/uploads/2010/11/tell-me-meeting-849.jpg"
]

module.exports = (robot) ->
  robot.hear /(product (people|guys))|(a lot of|so many) meetings/i, (msg) ->
    silly msg
    msg.send msg.random interestingImages
