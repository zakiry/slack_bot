# Description:
#   create pull requests in a Github repository
#
# Commands:
#   hubot cpr <feature name> into <base> - create pull request
#

# チャット上で指定したくなったら、改善する
REPO_NAME = 'slack_bot'

module.exports = (robot) ->
  github = require("githubot")(robot)
  url_api_base = "https://api.github.com"

  _getDate = ->
    theDate = new Date
    year  = theDate.getFullYear()
    month = theDate.getMonth() + 1
    date  = theDate.getDate()
    month = ("00" + month).slice(-2)
    date  = ("00" + date).slice(-2)
    "#{year}.#{month}.#{date}"

  robot.hear /^create PR ([-_\.0-9a-zA-Z]+) into ([-_\.0-9a-zA-Z]+)$/i, (msg) ->
    repository = REPO_NAME
    feature = msg.match[1]
    base = msg.match[2]

    url = "#{url_api_base}/repos/#{process.env.HUBOT_GITHUB_USER}/#{repository}/pulls"
    operate_user = msg.envelope.user.name
    return if operate_user != process.env.HUBOT_GITHUB_USER # 誰かがPRを作ることは今のところないため
    channel_name = msg.envelope.room

    title = "feature"
    body = "Created By #{operate_user} on #{channel_name} Channel"

    data = {
      "title" : title
      "body" : body
      "head" : feature
      "base" : base
    }

    github.post url, data, (pull) ->
      msg.send "プルリク送った" + pull.html_url

