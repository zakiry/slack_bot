# Description:
#   hubot show sasuoni images
#
# Commands:
#   hubot show sasuoni images when message contain word 'sasuoni'
#

fs = require('fs');
sasuoni_json = JSON.parse(fs.readFileSync('./const/sasuoni.json', 'utf8'));

module.exports = (robot) ->
  robot.hear /^(sasuoni|さすおに)$/i, (msg) ->
    msg.send sasuoni_json[Math.floor(Math.random() * sasuoni_json.length)]['image']

