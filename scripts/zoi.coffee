# Description:
#   hubot show sasuoni images
#
# Commands:
#   hubot show sasuoni images when message contain word 'sasuoni'
#

fs = require('fs');
zoi_json = JSON.parse(fs.readFileSync('./const/zoi.json', 'utf8'));

module.exports = (robot) ->
  robot.hear /^(zoi|ぞい)$/i, (msg) ->
    msg.send zoi_json[Math.floor(Math.random() * zoi_json.length)]['image']

