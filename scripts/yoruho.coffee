CronJob = require('cron').CronJob

module.exports = (robot) ->
  new CronJob
    cronTime:'0 0 0 * * 1-5'
    onTick: ->
      robot.send {room: '#general'}, 'よるほー'
    start: true
