# Description:
#   hubot show sasuoni images
#
# Commands:
#   hubot show sasuoni images when message contain word 'sasuoni'
#

fs = require('fs');
sasuoni_json = JSON.parse(fs.readFileSync('./const/sasuoni.json', 'utf8'));

module.exports = (robot) ->
  robot.hear /^(sasuoni|さすおに)\s*(.*)$/i, (msg) ->
    match_json = []
    for item in sasuoni_json
      match_json.push(item) if item['word_full'].indexOf(msg.match[2]) != -1

    msg.send match_json[Math.floor(Math.random() * match_json.length)]['image'] unless match_json.length == 0

