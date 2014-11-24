require './helper'

TextMessage = require('hubot/src/message').TextMessage

describe 'list', ->
  {robot, user, adapter} = {}

  shared_context.robot_is_running (ret) ->
    {robot, user, adapter} = ret

  beforeEach ->
    require('../scripts/list')(robot)

  it 'responds "command list"', (done) ->
    adapter.on 'send', (envelope, strings) ->
      expect(envelope.user.name).to.equal('mocha')
      # 以下の文字列から始まっていればOK
      expect(strings[0]).to.have.string('モノクロームのコマンド一覧')
    , done

    adapter.receive(new TextMessage(user, 'hubot list'))
