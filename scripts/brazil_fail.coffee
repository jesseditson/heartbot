# As requested on https://twitter.com/bcardarella/status/486885890837725184
#
# Send a sad brazilian everytime someone says fail. Images from http://sadbrazilians.tumblr.com/
#
# Thanks to Kimono Labs for giving me the JSON to get the images
#
#

silly = require '../lib/silly'

images = [
  "http://33.media.tumblr.com/75ad65b40e42b9bb0a487d29467e84f3/tumblr_n8f721uO1M1tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/6892659fd667d73d9fc395d3b95cff36/tumblr_n8f5ep7d051tga27vo1_1280.jpg",
  "http://31.media.tumblr.com/646d72d0ed87f6a8e8bd640c4115d36a/tumblr_n8f56swUqa1tga27vo1_1280.jpg",
  "http://31.media.tumblr.com/d6f5bdcc1125cf56ee5895c6551964e3/tumblr_n8f4k43t8e1tga27vo1_500.jpg",
  "http://33.media.tumblr.com/b0598e1cfcec1cbbc10fcc2cdfa2cd16/tumblr_n8f1my3NC81tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/dc3d3248d90863af69a77fc6ebd1a2ff/tumblr_n8f14lFxjF1tga27vo1_400.jpg",
  "http://38.media.tumblr.com/d7781dec87ec33de646228eb572cc630/tumblr_n8f0njtT6t1tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/6473d2bd4490e36408a7b262e2325016/tumblr_n8f0ag8zb31tga27vo1_1280.jpg",
  "http://33.media.tumblr.com/31da9f0503d0a3fa45fbf7f3b5c707e7/tumblr_n8ezyau21R1tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/4d5ae0314f0470451fe1103d52aa05f1/tumblr_n8ezrmjULR1tga27vo1_500.jpg",
  "http://38.media.tumblr.com/ae2c1e8f2eaa5925179efc6f58b2e8bd/tumblr_n8ezpcmyT31tga27vo1_500.png",
  "http://31.media.tumblr.com/547852fad45912bd1c272a710ea22345/tumblr_n8ezkcCFMK1tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/2029d95c2a089c5d783e30e14917cac8/tumblr_n8ezhoUlnO1tga27vo1_1280.jpg",
  "http://33.media.tumblr.com/3e912fd80c092452a431a75476b404cb/tumblr_n8ezd44NZY1tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/051c955c88d6766bd899d3aea29bcecc/tumblr_n8ez9qUFgY1tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/0acde0e3941a7e2af1b646251fe9f59e/tumblr_n8ez72JBrh1tga27vo1_1280.jpg",
  "http://33.media.tumblr.com/76c9bbe5d716ee6c44fd584b5ea0b370/tumblr_n8ez21fTYg1tga27vo1_1280.jpg",
  "http://31.media.tumblr.com/d042e22308381ad937bb654f7d12f0c8/tumblr_n8eyw4YglF1tga27vo1_1280.jpg",
  "http://33.media.tumblr.com/47ed3b4e1dbd118573d6b8c89aadff0b/tumblr_n8eyqxyhpa1tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/755d2ab04f3036243002d4ca6e20b90f/tumblr_n8eymxsIkI1tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/e2f86cb45055cde8f19651c654c5e17a/tumblr_n8ey793LJr1tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/676859b01430955fbbeb187bcfc4162f/tumblr_n8ey38eRxJ1tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/c3ad23a321d3ff8c39d57fc508729c45/tumblr_n8ey0cdDjh1tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/14b357de4fcce6c19b1e80eaaf3730d9/tumblr_n8exyoSrem1tga27vo1_1280.jpg",
  "http://33.media.tumblr.com/3800302734652658155623b269391489/tumblr_n8exx1tFB71tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/4c54c53e9b8de8324ac629eb725b2680/tumblr_n8exrdZt2R1tga27vo1_1280.jpg",
  "http://31.media.tumblr.com/e9a85d4e1d33bd766cb69d0027992396/tumblr_n8exnwJbMm1tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/04752cf77656023613affcebfbb0adfa/tumblr_n8exfaBBE51tga27vo1_1280.jpg",
  "http://31.media.tumblr.com/c40939296b0c078cdb9d17c004913919/tumblr_n8exalA1x91tga27vo1_1280.png",
  "http://37.media.tumblr.com/b722c9251c88c4c354e73ac0a9a6bf0a/tumblr_n8ex3ds6BN1tga27vo1_1280.jpg",
  "http://33.media.tumblr.com/75ad65b40e42b9bb0a487d29467e84f3/tumblr_n8f721uO1M1tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/6892659fd667d73d9fc395d3b95cff36/tumblr_n8f5ep7d051tga27vo1_1280.jpg",
  "http://31.media.tumblr.com/646d72d0ed87f6a8e8bd640c4115d36a/tumblr_n8f56swUqa1tga27vo1_1280.jpg",
  "http://31.media.tumblr.com/d6f5bdcc1125cf56ee5895c6551964e3/tumblr_n8f4k43t8e1tga27vo1_500.jpg",
  "http://33.media.tumblr.com/b0598e1cfcec1cbbc10fcc2cdfa2cd16/tumblr_n8f1my3NC81tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/dc3d3248d90863af69a77fc6ebd1a2ff/tumblr_n8f14lFxjF1tga27vo1_400.jpg",
  "http://38.media.tumblr.com/d7781dec87ec33de646228eb572cc630/tumblr_n8f0njtT6t1tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/6473d2bd4490e36408a7b262e2325016/tumblr_n8f0ag8zb31tga27vo1_1280.jpg",
  "http://33.media.tumblr.com/31da9f0503d0a3fa45fbf7f3b5c707e7/tumblr_n8ezyau21R1tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/4d5ae0314f0470451fe1103d52aa05f1/tumblr_n8ezrmjULR1tga27vo1_500.jpg",
  "http://38.media.tumblr.com/ae2c1e8f2eaa5925179efc6f58b2e8bd/tumblr_n8ezpcmyT31tga27vo1_500.png",
  "http://31.media.tumblr.com/547852fad45912bd1c272a710ea22345/tumblr_n8ezkcCFMK1tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/2029d95c2a089c5d783e30e14917cac8/tumblr_n8ezhoUlnO1tga27vo1_1280.jpg",
  "http://33.media.tumblr.com/3e912fd80c092452a431a75476b404cb/tumblr_n8ezd44NZY1tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/051c955c88d6766bd899d3aea29bcecc/tumblr_n8ez9qUFgY1tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/0acde0e3941a7e2af1b646251fe9f59e/tumblr_n8ez72JBrh1tga27vo1_1280.jpg",
  "http://33.media.tumblr.com/76c9bbe5d716ee6c44fd584b5ea0b370/tumblr_n8ez21fTYg1tga27vo1_1280.jpg",
  "http://31.media.tumblr.com/d042e22308381ad937bb654f7d12f0c8/tumblr_n8eyw4YglF1tga27vo1_1280.jpg",
  "http://33.media.tumblr.com/47ed3b4e1dbd118573d6b8c89aadff0b/tumblr_n8eyqxyhpa1tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/755d2ab04f3036243002d4ca6e20b90f/tumblr_n8eymxsIkI1tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/e2f86cb45055cde8f19651c654c5e17a/tumblr_n8ey793LJr1tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/676859b01430955fbbeb187bcfc4162f/tumblr_n8ey38eRxJ1tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/c3ad23a321d3ff8c39d57fc508729c45/tumblr_n8ey0cdDjh1tga27vo1_1280.jpg",
  "http://37.media.tumblr.com/14b357de4fcce6c19b1e80eaaf3730d9/tumblr_n8exyoSrem1tga27vo1_1280.jpg",
  "http://33.media.tumblr.com/3800302734652658155623b269391489/tumblr_n8exx1tFB71tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/4c54c53e9b8de8324ac629eb725b2680/tumblr_n8exrdZt2R1tga27vo1_1280.jpg",
  "http://31.media.tumblr.com/e9a85d4e1d33bd766cb69d0027992396/tumblr_n8exnwJbMm1tga27vo1_1280.jpg",
  "http://38.media.tumblr.com/04752cf77656023613affcebfbb0adfa/tumblr_n8exfaBBE51tga27vo1_1280.jpg",
  "http://31.media.tumblr.com/c40939296b0c078cdb9d17c004913919/tumblr_n8exalA1x91tga27vo1_1280.png",
  "http://37.media.tumblr.com/b722c9251c88c4c354e73ac0a9a6bf0a/tumblr_n8ex3ds6BN1tga27vo1_1280.jpg",
]

module.exports = (robot) ->
  return;
  robot.hear /.*(fail).*/i, (msg) ->
    silly msg
    msg.send msg.random images
