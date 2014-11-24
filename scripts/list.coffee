# Description
#   return command list
#
# Commands:
#   hubot list - Reply with list

# コマンドリスト
COMMAND_LIST = [
  'monochrome show slack_bot pulls - monochromeのリポジトリのpull request一覧を表示する',
]

module.exports = (robot) ->
  robot.respond /list/i, (msg) ->
    # 出力生成
    str = 'モノクロームのコマンド一覧\n'
    for command in COMMAND_LIST
      str += command + '\n'

    # 出力
    msg.send str
