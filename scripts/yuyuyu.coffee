# Description
#   return anime images
#
# Commands:
#   #{anime_title} - Reply with list

# 画像url
YUYUYU  = "http://shingeki.tv/yuyuyu.tv/special/img_icon/"

module.exports = (robot) ->
  # ゆゆゆアイコン
  robot.hear /^(yuyuyu|ゆゆゆ)$/i, (msg) ->
    # 画像番号
    num = Math.floor(Math.random() * 124) + 1
    if (num == 39 || num == 61)
      num = num + 1
    num_str = ( "000" + num ).slice(-3)
    str = "#{YUYUYU}yyy_#{num_str}.jpg"

    # 出力
    msg.send str

