# useFakeTimersの挙動が不明なのでcronのテストは省略
# message送る程度なので、必要になったらやる
#
# 2つ同時にcronを走らせた時に、useFakeTimersの使い方がわからない
# 2つとも同じ時刻を見ている気がする？
#
###

require './helper'

describe 'yoruho', ->
  {robot, user, adapter} = {}

  shared_context.robot_is_running (ret) ->
    {robot, user, adapter} = ret

  beforeEach ->
    require('../scripts/yoruho')(robot)

  clock = null

  before ->
    today = Date.parse('2014-11-23T23:59:59+09:00')
    clock = sinon.useFakeTimers(today)

  after ->
    clock.restore()

  it 'notifies yoruho', (done) ->
    adapter.on 'send', (envelope, strings) ->
      expect(envelope.room).to.equal('#general')
      expect(strings[0]).to.equal('よるほー')
    , done()
    clock.tick(1000)
###
