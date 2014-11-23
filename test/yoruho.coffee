expect = require('chai').expect
sinon = require('sinon')

Robot = require('hubot/src/robot')
TextMessage = require('hubot/src/message').TextMessage

describe 'yoruho', ->
  robot = null
  user = null
  adapter = null
  clock = null

  before ->
    today = Date.parse('2014-11-23T23:59:59+09:00')
    clock = sinon.useFakeTimers(today)
  after ->
    clock.restore()

  beforeEach (done) ->
    robot = new Robot(null, 'mock-adapter', false, 'hubot')

    robot.adapter.on 'connected', ->
      require('../scripts/yoruho')(robot)
      adapter = robot.adapter
      done()
    robot.run()
  afterEach -> robot.shutdown()

  it 'notifies yoruho', (done) ->
    adapter.on 'send', (envelope, strings) ->
      expect(envelope.room).to.equal('#general')
      expect(strings[0]).to.equal('よるほー')
      done()
    clock.tick(1000)

