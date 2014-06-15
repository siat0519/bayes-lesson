# -*- coding: utf-8 -*-
10.times do|n|
  #puts n.to_s
end


# -----
weather = {
  :sun => 7,
  :rain => 1
}

B_and_A = {
  :sun => {
    :yes => 4,
    :no  => 1
  },
  :rain => {
    :yes => 3,
    :no  =>2
  }
}

# -----
# 確率:
P = {}

# 目標:
# 「BさんがAさんの誘いに乗った時に
#   雨が降っていない確率を求める」
#  P(H_sun|D)  ->  P[:H_sun_D]

# D(データ): BさんがAさんの誘いに乗った
# H(仮定)  : 雨が降っていない
# H_sun
# H_rain
puts "-" * 40
puts "事前確率"
P["H_sun"] = (weather[:sun]) / (weather[:sun] + weather[:rain]).to_f
puts "P(H_sun): %0.3f" % P["H_sun"]

# P(H_rain)
P["H_rain"] = (weather[:rain]) / (weather[:sun] + weather[:rain]).to_f
puts "P(H_rain): %0.3f" % P["H_rain"]


puts "-" * 40
puts "尤度"

P["D|H_sun"] = B_and_A[:sun][:yes] / (B_and_A[:sun][:yes] + B_and_A[:sun][:no]).to_f
puts "P(D|H_sun): %0.3f" % P["D|H_sun"]

P["D|H_rain"] = B_and_A[:rain][:yes] / (B_and_A[:rain][:yes] + B_and_A[:rain][:no]).to_f
puts "P(D|H_rain): %0.3f" % P["D|H_rain"]

# P(D) = P(D|H_sun)P(H_sun) + P(D|H_rain)P(H_rain)
puts "-" * 40
puts "ベイズの展開公式"
P["D"] = P["D|H_sun"] * P["H_sun"] + P["D|H_rain"] * P["H_rain"]
puts "P(D) = P(D|H_sun) * P(H_sun) + P(D|H_rain) * P(H_rain): %0.3f" % P["D"]


# 分子の式
# P(D|Hi)P(Hi)
# でも、晴れの時だから...
# -> P(D|H_sun)P(H_sun)
puts "-" * 40
puts "ベイズの定理を適用（事後確率）"

# ベイズの定理
# 目標
# P(H_sun|D) = P(D|H_sun)P(H_sun) / P(D)
P["H_sun|D"] = P["D|H_sun"] * P["H_sun"] / P["D"]
puts "P(H_sun|D): %0.3f" % P["H_sun|D"]
puts "-" * 40
