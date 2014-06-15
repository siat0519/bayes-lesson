# -*- coding: utf-8 -*-
10.times do|n|
  #puts n.to_s
end


# -----
sun, rain = 7, 1
sun_b_drink_with_a, sun_b_doesnt_drink_with_a = 4, 1
rain_b_drink_with_a, rain_b_doesnt_drink_with_a = 3, 2

# -----
# 目標:
# 「BさんがAさんの誘いに乗った時に
#   雨が降っていない確率を求める」 ->  P(H_sun|D)

# D(データ): BさんがAさんの誘いに乗った
# H(仮定)  : 雨が降っていない
# H_sun
# H_rain

# P(H_sun)
puts "-" * 40
puts "事前確率"
p_h_sun = (sun) / (sun + rain).to_f
puts "P(H_sun): %0.3f" % p_h_sun

# P(H_rain)
p_h_rain = (rain) / (sun + rain).to_f
puts "P(H_rain): %0.3f" % p_h_rain

puts "-" * 40
puts "尤度"
# P(D) = P(D|H_sun)P(H_sun) + P(D|H_rain)P(H_rain)
p_d_h_sun = sun_b_drink_with_a / (sun_b_drink_with_a + sun_b_doesnt_drink_with_a).to_f
puts "P(D|H_sun): %0.3f" % p_d_h_sun

p_d_h_rain = rain_b_drink_with_a / (rain_b_drink_with_a + rain_b_doesnt_drink_with_a).to_f
puts "P(D|H_rain): %0.3f" % p_d_h_rain

puts "-" * 40
puts "ベイズの展開公式"
p_d = p_d_h_sun * p_h_sun + p_d_h_rain * p_h_rain
puts "P(D) = P(D|H_sun) * P(H_sun) + P(D|H_rain) * P(H_rain): %0.3f" % p_d


# 分子の式
# P(D|Hi)P(Hi)
# でも、晴れの時だから...
# -> P(D|H_sun)P(H_sun)

puts "-" * 40
puts "ベイズの定理を適用（事後確率）"

# ベイズの定理
# 目標
# P(H_sun|D) = P(D|H_sun)P(H_sun) / P(D)
p_h_sun_d = p_d_h_sun * p_h_sun / p_d
puts "P(H_sun|D): %0.3f" % p_h_sun_d
puts "-" * 40
