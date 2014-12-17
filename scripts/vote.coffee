# Description
#   投票を行う
#
# Commands:
#   #{name}++ - name+1

CronJob = require('cron').CronJob

module.exports = (robot) ->
  KEY_SCORE = 'key_score'

  getScores = () ->
    return robot.brain.get(KEY_SCORE) or {}

  # 投票機能相手を+1できる
  changeScore = (name, diff) ->
    source = getScores()
    score = source[name] or 0
    new_score = score + diff
    source[name] = new_score

    robot.brain.set KEY_SCORE, source
    return new_score

  # 自分に投票できなくする
  addScore = (name, voter) ->
    return "自分には投票できません" if name == voter
    new_score = changeScore(name, 1)
    return "#{name}: #{new_score}"

  # 爆撃機能、自分のポイントを10消費して相手のポイントを0にする
  resetScore = (name, bomber) ->
    source = getScores()
    bomber_score = source[bomber] or 0
    # 所持ポイントが10より少ない場合は爆撃できない
    return "所持ポイントが足りません" if bomber_score<10

    # コストを支払う
    changeScore(bomber, -10)
    # 10%の確率で失敗する
    return "爆撃に失敗しました 10pt失います" if Math.floor(Math.random() * 10) == 0

    # 爆撃成功
    changeScore(name, -source[name])
    return "success! 10pt消費します"

  robot.hear /^@*(.+?):*\+\+$/i, (msg) ->
    name = msg.match[1]
    result_msg = addScore(name, msg.message.user.name)
    msg.send result_msg

  robot.hear /^@*(.+):*:bomb:$/i, (msg) ->
    name = msg.match[1]
    result_msg = resetScore(name, msg.message.user.name)
    msg.send result_msg

  robot.hear /vote list/i, (msg) ->
    source = getScores()
    str = ""
    for name, score of source
      str += "#{name}: #{score}\n"
    msg.send str

  # 1ヶ月でリセット
  new CronJob
    cronTime:'0 0 0 1 * *'
    onTick: ->
      robot.brain.set KEY_SCORE, null
    start: true

