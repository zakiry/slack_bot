# Description:
#   hubot show sasuoni images
#
# Commands:
#   hubot show sasuoni images when message contain word 'sasuoni'
#
sasuoni_json =
[{"word_full":"良い腕だな","word":"良い腕","image":"https://pbs.twimg.com/media/Bxk4ZMBCEAAVtih.jpg","src":"http://t.co/3PYdt89at2"},{"word_full":"さすがお兄さま！","word":"さすおに","image":"https://pbs.twimg.com/media/Bxk4earCAAE37Qp.jpg","src":"http://t.co/hLQb0Af6k8"},{"word_full":"あのレベルの悩みなら自分は卒業済みです","word":"卒業済み","image":"https://pbs.twimg.com/media/Bxk4raQCQAAKcl4.jpg","src":"http://t.co/XTjQgu2x5m"},{"word_full":"お手並み拝見といくか","word":"お手並み拝見","image":"https://pbs.twimg.com/media/Bxk4v1aCAAA-nd6.jpg","src":"http://t.co/4nMf379XaL"},{"word_full":"誰にでもできることじゃないよ","word":"誰にでも","image":"https://pbs.twimg.com/media/Bxk4z3PCIAA2Mbo.jpg","src":"http://t.co/qHeq4RDBGq"},{"word_full":"オフレコで頼みたいんだけど","word":"オフレコ","image":"https://pbs.twimg.com/media/Bxk43qTCYAEe8IW.jpg","src":"http://t.co/CLJcbJZg54"},{"word_full":"無論です","word":"無論","image":"https://pbs.twimg.com/media/Bxk46K_CIAQycCd.jpg","src":"http://t.co/H0EAwW0rY2"},{"word_full":"ストレスがたまってるんですね","word":"ストレス","image":"https://pbs.twimg.com/media/Bxk4_AmCcAAz2Ts.jpg","src":"http://t.co/t7mRTIbD7f"},{"word_full":"お前は阿呆だ","word":"アホ","image":"https://pbs.twimg.com/media/Bxk5CGCCEAAkazu.jpg","src":"http://t.co/IZS6GQBu8Z"},{"word_full":"やれやれ……","word":"やれやれ","image":"https://pbs.twimg.com/media/Bxk5HDYCEAE1w2h.jpg","src":"http://t.co/Qtl9nt6f5c"},{"word_full":"兄貴の方、ありゃあ、ヤバイな……多分ありゃ、殺ってるな","word":"殺ってるな","image":"https://pbs.twimg.com/media/Bxk5TkICAAEi7E5.jpg","src":"http://t.co/nVg2Nrhlcj"},{"word_full":"俺には分かるんだよ","word":"分かる","image":"https://pbs.twimg.com/media/Bxk5XGzCYAE-bUm.jpg","src":"http://t.co/ypLMfXMbyG"},{"word_full":"お兄さまはまたしても不可能を可能にされました！","word":"おにまたふか","image":"https://pbs.twimg.com/media/Bxk5cBNCUAEO0y3.jpg","src":"http://t.co/ZzztYBDPsC"},{"word_full":"＼御曹司！／","word":"おんぞうし","image":"https://pbs.twimg.com/media/Bxk5iNwCUAAT3om.jpg","src":"http://t.co/C5kTDU56EO"},{"word_full":"...","word":"おにいさまの解説","image":"https://pbs.twimg.com/media/Bxk5nQ4CUAE-WLY.jpg","src":"http://t.co/mHv1J4UY8j"},{"word_full":"続きをどうぞ","word":"続き","image":"https://pbs.twimg.com/media/Bxk5qsxCMAAp_Ir.jpg","src":"http://t.co/pUuMLVMdTA"},{"word_full":"？","word":"ん？","image":"https://pbs.twimg.com/media/Bxk5stYCUAEE_yW.jpg","src":"http://t.co/AJRzI51ARf"}];

module.exports = (robot) ->
  robot.hear /^(sasuoni|さすおに)$/i, (msg) ->    
    msg.send sasuoni_json[Math.floor(Math.random() * sasuoni_json.length)]['image']

