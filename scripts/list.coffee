# Description
#   return command list
#
# Commands:
#   hubot list - Reply with list

module.exports = (robot) ->
  robot.respond /list/i, (msg) ->
    msg.send 'comming soon'
