CronJob = require('cron').CronJob

module.exports = (robot) ->
  new CronJob
    cronTime:'0 0 0 * * *'
    onTick: ->
      robot.send {room: '#general'}, 'よるほー'
    start: true

  new CronJob
    cronTime:'0 0 19 * * 1-5'
    onTick: ->
      robot.send {room: '#general'}, '定時、早く帰ろう'
    start: true

  new CronJob
    cronTime:'0 0 11-18 * * 1-5'
    onTick: ->
      robot.send {room: '#healthy'}, '@channel 散歩の時間です'
    start: true

