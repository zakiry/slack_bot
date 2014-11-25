CronJob = require('cron').CronJob

module.exports = (robot) ->
  new CronJob
    cronTime:'0 0 0 * * *'
    onTick: ->
      robot.send {room: '#general'}, 'よるほー'
    start: true

  new CronJob
    cronTime:'0 0 13 * * 1-5'
    onTick: ->
      robot.send {room: '#general'}, '昼休み、電池買いに行こう'
    start: true

  new CronJob
    cronTime:'0 0 19 * * 1-5'
    onTick: ->
      robot.send {room: '#general'}, '定時、早く帰ろう'
    start: true

