# Description:
#   hubot show zoi images
#
# Commands:
#   hubot show zoi images when message contain word 'zoi'
#

fs = require('fs');
zoi_json = JSON.parse(fs.readFileSync('./const/zoi.json', 'utf8'));

module.exports = (robot) ->
  robot.hear /^(zoi|ぞい)$/i, (msg) ->
    msg.send zoi_json[Math.floor(Math.random() * zoi_json.length)]['image']

