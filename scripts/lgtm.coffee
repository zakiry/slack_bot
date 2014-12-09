# Description:
#   LGTM image from http://www.lgtm.in/.
#
# Commands:
#   lgtm


request = require 'request'
cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.hear /^LGTM$/i, (msg) ->
    url = 'http://www.lgtm.in/g'
    request url, (error, response, body) ->
      if error or response.statusCode != 200
        msg.send 'error'
      else
        $ = cheerio.load body
        msg.send $('#imageUrl').val()
