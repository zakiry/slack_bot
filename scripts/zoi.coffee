# Description:
#   hubot show zoi images
#
# Commands:
#   hubot show zoi images when message contain word 'zoi'
#

fs = require('fs');
zoi_json = JSON.parse(fs.readFileSync('./const/zoi.json', 'utf8'));

module.exports = (robot) ->
  robot.hear /^(zoi|ぞい)\s*(.*)$/i, (msg) ->
    match_json = []
    for item in zoi_json
      match_json.push(item) if item['word'].indexOf(msg.match[2]) != -1
    msg.send match_json[Math.floor(Math.random() * match_json.length)]['image'] unless match_json.length == 0

