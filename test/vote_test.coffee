require './helper'

TextMessage = require('hubot/src/message').TextMessage
KEY_SCORE = 'key_score'

describe 'vote', ->
  {robot, user, adapter} = {}

  shared_context.robot_is_running (ret) ->
    {robot, user, adapter} = ret

  beforeEach ->
    require('../scripts/vote')(robot)

  it 'responds "name++"', (done) ->
    adapter.on 'send', (envelope, strings) ->
      expect(strings[0]).to.have.string('name: 1')
    , done
    adapter.receive(new TextMessage(user, 'name++'))

  it 'responds "@name: ++"', (done) ->
    adapter.on 'send', (envelope, strings) ->
      expect(strings[0]).to.have.string('name: 1')
    , done
    adapter.receive(new TextMessage(user, '@name: ++'))

  it 'deny self vote', (done) ->
    adapter.on 'send', (envelope, strings) ->
      expect(strings[0]).to.equal('自分には投票できません')
    , done
    adapter.receive(new TextMessage(user, 'mocha++'))

describe 'bomb', ->
  {robot, user, adapter} = {}

  shared_context.robot_is_running (ret) ->
    {robot, user, adapter} = ret

  beforeEach ->
    require('../scripts/vote')(robot)

  it 'not enough "name:bomb:"', (done) ->
    adapter.on 'send', (envelope, strings) ->
      expect(strings[0]).to.have.string('足りません')
    , done
    adapter.receive(new TextMessage(user, 'name:bomb:'))

  it 'success or fail "name:bomb:"', (done) ->
    robot.brain.set KEY_SCORE, {mocha:"10"}
    adapter.on 'send', (envelope, strings) ->
      expect(strings[0]).to.have.string('10pt')
    , done
    adapter.receive(new TextMessage(user, 'name:bomb:'))

describe 'vote list', ->
  {robot, user, adapter} = {}

  shared_context.robot_is_running (ret) ->
    {robot, user, adapter} = ret

  beforeEach ->
    require('../scripts/vote')(robot)

  it 'responds "vote list"', (done) ->
    robot.brain.set KEY_SCORE, {mocha:"10"}
    adapter.on 'send', (envelope, strings) ->
      expect(strings[0]).to.have.string('mocha: 10')
    , done
    adapter.receive(new TextMessage(user, 'vote list'))
