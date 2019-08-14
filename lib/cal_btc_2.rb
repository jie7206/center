require 'rails'

# 美元汇率、WOR兑换美元汇率
@usd_rate = 6.7646
@wor_rate = 0.3825
# 每月资产增值率
@apollo_rate_1 = 0.071
@apollo_rate_2 = 0.095
# WOR每月增值率
@wor_grow_rate = 0.07
# 比特币每月增值率
@btc_grow_rate = 0.07
# 本金设定
@ben = 5000

def arrange_1
    unit = @ben*@apollo_rate_2
    # 不算社区的基本收入
    basic_income = unit*7
    # 第1代的社区奖金(分享1人拿1代50%)
    lv_1_bonu = unit*0.5
    lv_1_bonus = lv_1_bonu*3
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit+lv_1_bonu)*3
    lv_0_bonus_2 = (unit*0.5)*3
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = 35000
    # arrange_1：投资：$35000 收入：¥48706 (18954 wor) /月 4.8个月回本
    puts "arrange_1：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", 35000/total)}个月回本"
end

def arrange_2
    unit = @ben*@apollo_rate_2
    u8k = 8400*@apollo_rate_2
    # 不算社区的基本收入
    basic_income = unit*4 + u8k*3
    # 第1代的社区奖金(分享1人拿1代50%)
    lv_1_bonu = unit*0.5
    lv_1_bonus = lv_1_bonu*3
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (u8k+lv_1_bonu)*3
    lv_0_bonus_2 = (unit*0.5)*3
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*9
    # arrange_2：投资：$@ben*9 收入：¥62142 (24182 wor) /月 4.9个月回本
    puts "arrange_2：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange_3
    unit = @ben*@apollo_rate_2
    # 不算社区的基本收入
    basic_income = unit*3 + unit*6
    # 第1代的社区奖金(分享1人拿1代50%)
    lv_1_bonu = unit*0.5
    lv_1_bonus = lv_1_bonu*3
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit+lv_1_bonu)*3
    lv_0_bonus_2 = (unit*0.5)*3
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*9
    # arrange_3：投资：$@ben*9 收入：¥55425 (21568 wor) /月 5.5个月回本
    puts "arrange_3：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange_4
    unit = @ben*@apollo_rate_2
    # 不算社区的基本收入
    basic_income = unit*3 + unit*6
    # 第1代的社区奖金(分享1人拿1代50%)
    #lv_1_bonu = unit*0.5
    #lv_1_bonus = lv_1_bonu*3
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit)*6
    #lv_0_bonus_2 = (unit*0.5)*3
    lv_0_bonus = lv_0_bonus_1 #+ lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_0_bonus #+lv_1_bonus
    invest = @ben*9
    # arrange_4：投资：$@ben*9 收入：¥50386 (19607 wor) /月 6.0个月回本
    puts "arrange_4：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange_5
    unit = (@ben+4)*@apollo_rate_2
    u6k = 6666*@apollo_rate_2
    # 不算社区的基本收入
    basic_income = unit + u6k*6
    # 第1代的社区奖金(分享1人拿1代50%)
    #lv_1_bonu = unit*0.5
    #lv_1_bonus = lv_1_bonu*3
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (u6k)*6
    #lv_0_bonus_2 = (unit*0.5)*3
    lv_0_bonus = lv_0_bonus_1 #+ lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_0_bonus #+lv_1_bonus
    invest = @ben*9
    # arrange_5：投资：$@ben*9 收入：¥57102 (22221 wor) /月 5.3个月回本
    puts "arrange_5：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange_6
    unit = @ben*@apollo_rate_2
    # 不算社区的基本收入
    basic_income = unit*2+4000*@apollo_rate_1+1000*@apollo_rate_1
    # 第1代的社区奖金(分享1人拿1代50%)
    #lv_1_bonu = 0 #unit*0.5
    #lv_1_bonus = lv_1_bonu*3
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (5000*@apollo_rate_2+4000*@apollo_rate_1+1000*@apollo_rate_1) #+lv_1_bonu)
    #lv_0_bonus_2 = (0*0.5)*3
    lv_0_bonus = lv_0_bonus_1 #+ lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_0_bonus #+lv_1_bonus
    invest = @ben*3
    # arrange_6
    puts "arrange_6：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange_7
    unit5 = @ben*@apollo_rate_2
    unit1 = 1000*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit5*2+unit1*5
    # 第1代的社区奖金(分享1人拿1代50%)
    lv_1_bonu = unit1*0.5
    lv_1_bonus = lv_1_bonu*3
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit5+unit1*2) + lv_1_bonus
    lv_0_bonus_2 = (unit1*0.5)*3
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_0_bonus +lv_1_bonus
    invest = @ben*3
    # arrange_7
    puts "arrange_7：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange_8
    unit5 = @ben*@apollo_rate_2
    unit1 = 1000*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit5*2+unit1*5
    # 第1代的社区奖金(分享1人拿1代50%)
    lv_1_bonu = unit1*0.5
    lv_1_bonus = lv_1_bonu*2
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit5+unit1*3) + lv_1_bonus
    lv_0_bonus_2 = (unit1*0.5)*2
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_0_bonus +lv_1_bonus
    invest = @ben*3
    # arrange_8
    puts "arrange_8：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange_9
    unit = @ben*@apollo_rate_2
    # 不算社区的基本收入
    basic_income = unit*3
    # 第1代的社区奖金(分享1人拿1代50%)
    #lv_1_bonu = unit1*0.5
    #lv_1_bonus = lv_1_bonu*3
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    #lv_0_bonus_1 = (unit5+unit1*2) + lv_1_bonus
    #lv_0_bonus_2 = (unit1*0.5)*3
    #lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income #+lv_0_bonus +lv_1_bonus
    invest = @ben*3
    # arrange_9
    puts "arrange_9：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange_10
    unit = @ben*@apollo_rate_2
    u8k = 8400*@apollo_rate_2
    # 不算社区的基本收入
    basic_income = unit*4 + u8k*3
    # 第1代的社区奖金(分享3人拿1代100%，2代50%)
    lv_1_bonu = unit*3
    lv_1_bonus = lv_1_bonu + 0 + 0
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (u8k+lv_1_bonu)  + u8k + u8k
    lv_0_bonus_2 = (unit*0.5)*3
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*9
    # arrange_10
    puts "arrange_10：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange10a
    unit = @ben*@apollo_rate_2
    u8k = 8400*@apollo_rate_2
    u1k = 1000*@apollo_rate_1
    u2k = 2000*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit*2 + u8k*3 + u2k*2 + u1k*6
    # 第1代的社区奖金(分享3人拿1代100%，2代50%)
    lv_1_bonu_1 = unit*1 + u2k*2
    lv_1_bonu_2 = u1k*3
    lv_1_bonus = lv_1_bonu_1 + lv_1_bonu_2*2
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (u8k+lv_1_bonu_1) + (u8k+lv_1_bonu_2)*2
    lv_0_bonus_2 = (unit*1 + u2k*2 + u1k*6)*0.5
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*9
    # arrange_10
    puts "arrange10a：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange10b
    unit = @ben*@apollo_rate_2
    u8k = 8700*@apollo_rate_2
    # 不算社区的基本收入
    basic_income = unit*4 + u8k*3
    # 第1代的社区奖金(分享3人拿1代100%，2代50%)
    lv_1_bonu = unit*3
    lv_1_bonus = lv_1_bonu + 0 + 0
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (u8k+lv_1_bonu)  + u8k + u8k
    lv_0_bonus_2 = (unit*0.5)*3
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*9
    # arrange_10
    puts "arrange10b：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange_10_13333
    unit = @ben*@apollo_rate_2
    u8k = 13333*@apollo_rate_2
    # 不算社区的基本收入
    basic_income = unit*1 + u8k*3
    # 第1代的社区奖金(分享3人拿1代100%，2代50%)
    lv_1_bonu = 0 #unit*3
    lv_1_bonus = lv_1_bonu + 0 + 0
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (u8k+lv_1_bonu)  + u8k + u8k
    lv_0_bonus_2 = 0 #(unit*0.5)*3
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*9
    # arrange_10
    puts "arrange_10_13333：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange11a
    unit = @ben*@apollo_rate_2
    u1k = 1000*@apollo_rate_1
    u17 = 1750*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit*2 + u17 + u1k*4
    # 第1代的社区奖金(分享3人拿1代100%，2代50%)
    lv_1_bonu = u1k*3
    lv_1_bonus = lv_1_bonu + 0 + 0
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit+lv_1_bonu)  + u17 + u1k
    lv_0_bonus_2 = (u1k*0.5)*3
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*3 + 750
    puts "arrange11a：目前：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange11g
    unit = @ben*@apollo_rate_2
    u1k = 1000*@apollo_rate_1
    u7k = 5750*@apollo_rate_2
    # 不算社区的基本收入
    basic_income = unit*3 + u7k + u1k*3
    # 第1代的社区奖金(分享3人拿1代100%，2代50%)
    lv_1_bonu = unit + u1k*2
    lv_1_bonus = lv_1_bonu + 0 + 0
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit+lv_1_bonu)  + u7k + u1k
    lv_0_bonus_2 = (unit+u1k*2)*0.5
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*3 + 4000 + 750 + 4000
    puts "arrange11g：扶一：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange11c
    unit = @ben*@apollo_rate_2
    u1k = 1000*@apollo_rate_1
    u17 = 1750*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit*3 + u17 + u1k*3
    # 第1代的社区奖金(分享3人拿1代100%，2代50%)
    lv_1_bonu = unit + u1k*2
    lv_1_bonus = lv_1_bonu + 0 + 0
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit+lv_1_bonu)  + u17 + u1k
    lv_0_bonus_2 = (unit + u1k*2)*0.5
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*3 + 4000 + 750
    puts "arrange11c：目前：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange11f
    unit = @ben*@apollo_rate_2
    u1k = 1000*@apollo_rate_1
    u17 = 1750*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit*4 + u17 + u1k*2
    # 第1代的社区奖金(分享3人拿1代100%，2代50%)
    lv_1_bonu = unit*2 + u1k
    lv_1_bonus = lv_1_bonu + 0 + 0
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit+lv_1_bonu)  + u17 + u1k
    lv_0_bonus_2 = (unit*2 + u1k)*0.5
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*3 + 4000 + 750 + 4000
    puts "arrange11f：扶二：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange11h
    unit = @ben*@apollo_rate_2
    u1k = 1000*@apollo_rate_1
    u17 = 1750*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit*5 + u17 + u1k*1
    # 第1代的社区奖金(分享3人拿1代100%，2代50%)
    lv_1_bonu = unit*3
    lv_1_bonus = lv_1_bonu + 0 + 0
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit+lv_1_bonu)  + u17 + u1k
    lv_0_bonus_2 = (unit*3)*0.5
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*3 + 4000 + 750 + 4000 + 4000
    puts "arrange11h：扶三：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange11j
    unit = @ben*@apollo_rate_2
    u1k = 1000*@apollo_rate_1
    u17 = 1750*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit*6 + u17 + u1k*1
    # 第2代的社区奖金(分享1人拿1代50%)
    lv_2_bonu = unit*1*0.5
    lv_2_bonus = lv_2_bonu + 0 + 0
    # 第1代的社区奖金(分享3人拿1代100%，2代50%，3代30%)
    lv_1_bonu = (unit+lv_2_bonu) + unit*2
    lv_1_bonus_1 = lv_1_bonu + 0 + 0
    lv_1_bonus_2 = (unit*1)*0.5
    lv_1_bonus = lv_1_bonus_1 + lv_1_bonus_2
    # 第0代的社区奖金(分享3人拿1代100%，2代50%，3代30%)
    lv_0_bonus_1 = (unit+lv_1_bonu)  + u17 + u1k
    lv_0_bonus_2 = (unit*3)*0.5
    lv_0_bonus_3 = (unit*1)*0.3
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2 + lv_0_bonus_3
    # 总收入(美元)
    total = basic_income+lv_0_bonus+lv_1_bonus+lv_2_bonus
    invest = @ben*3 + 4000 + 750 + 4000 + 4000 + 5000
    puts "arrange11j：四代：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange11k
    unit = @ben*@apollo_rate_2
    u1k = 1000*@apollo_rate_1
    u17 = 1750*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit*6 + u17 + u1k*3
    # 第3代的总利息
    lv_3_lixi = unit*3
    # 第2代的社区奖金--看第3代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_2_bonus = lv_3_lixi*1.0
    # 第1代的社区奖金--看第2代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_1_bonus_1 = (unit + u1k*2)*1.0
    lv_1_bonus_2 = lv_3_lixi*0.5
    lv_1_bonus = lv_1_bonus_1 + lv_1_bonus_2
    # 第0代的社区奖金--看第1代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_0_bonus_1 = (unit+u17+u1k)*1.0
    lv_0_bonus_2 = (unit+u1k*2)*0.5
    lv_0_bonus_3 = lv_3_lixi*0.3
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2 + lv_0_bonus_3
    # 总收入(美元)
    total = basic_income+lv_0_bonus+lv_1_bonus+lv_2_bonus
    invest = @ben*6 + 1700 + 1000*3
    puts "arrange11k：满四：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange11l
    unit = @ben*@apollo_rate_2
    u1k = 1000*@apollo_rate_1
    u17 = 1750*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit*4 + u17 + u1k*3
    # 第3代的总利息
    lv_3_lixi = unit*1
    # 第2代的社区奖金--看第3代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_2_bonus = lv_3_lixi*0.5
    # 第1代的社区奖金--看第2代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_1_bonus_1 = (unit+lv_2_bonus) + u1k*2
    lv_1_bonus_2 = lv_3_lixi*0.5
    lv_1_bonus = lv_1_bonus_1 + lv_1_bonus_2
    # 第0代的社区奖金--看第1代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_0_bonus_1 = (unit+lv_1_bonus)  + u17 + u1k
    lv_0_bonus_2 = (unit+lv_2_bonus+u1k*2)*0.5
    lv_0_bonus_3 = lv_3_lixi*0.3
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2 + lv_0_bonus_3
    # 总收入(美元)
    total = basic_income+lv_0_bonus+lv_1_bonus+lv_2_bonus
    invest = @ben*4 + 1700 + 1000*3
    puts "arrange11l：单四：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange11m
    unit = @ben*@apollo_rate_2
    u1k = 1000*@apollo_rate_1
    u17 = 1750*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit*4 + u17 + u1k*5
    # 第3代的总利息
    lv_3_lixi = unit*1 + u1k*2
    # 第2代的社区奖金--看第3代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_2_bonus = lv_3_lixi*1.0
    # 第1代的社区奖金--看第2代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_1_bonus_1 = ((unit+lv_2_bonus) + u1k*2)*1.0
    lv_1_bonus_2 = lv_3_lixi*0.5
    lv_1_bonus = lv_1_bonus_1 + lv_1_bonus_2
    # 第0代的社区奖金--看第1代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_0_bonus_1 = ((unit+lv_1_bonus)  + u17 + u1k)*1.0
    lv_0_bonus_2 = (unit+lv_2_bonus+u1k*2)*0.5
    lv_0_bonus_3 = lv_3_lixi*0.3
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2 + lv_0_bonus_3
    # 总收入(美元)
    total = basic_income+lv_0_bonus+lv_1_bonus+lv_2_bonus
    invest = @ben*4 + 1700 + 1000*3 + 1000*2
    puts "arrange11m：三四：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange11i
    unit = @ben*@apollo_rate_2
    u1k = 1000*@apollo_rate_1
    u17 = 1750*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit*6 + u17 + u1k*1
    # 第1代的社区奖金(分享3人拿1代100%，2代50%)
    lv_1_bonu = unit*4
    lv_1_bonus = lv_1_bonu + 0 + 0
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit+lv_1_bonu)  + u17 + u1k
    lv_0_bonus_2 = (unit*4)*0.5
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*3 + 4000 + 750 + 4000 + 4000 + 5000
    puts "arrange11i：扶四：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange11d
    unit = @ben*@apollo_rate_2
    u1k = 1000*@apollo_rate_1
    u17 = 1750*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit*3 + u17 + u1k*3
    # 第1代的社区奖金(分享3人拿1代100%，2代50%)
    lv_1_bonu = unit + u1k*2
    lv_1_bonus = lv_1_bonu + 0 + 0
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit+lv_1_bonu)  + u17 + u1k
    lv_0_bonus_2 = (unit + u1k*2)*0.5
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*3 + 4000 + 750
    puts "arrange11d：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange11e
    unit = @ben*@apollo_rate_2
    u1k = 1000*@apollo_rate_1
    u17 = 1750*@apollo_rate_1
    # 不算社区的基本收入
    basic_income = unit*3 + u17 + u1k*3
    # 第1代的社区奖金(分享3人拿1代100%，2代50%)
    lv_1_bonu = unit+u1k*2
    lv_1_bonus = lv_1_bonu + 0 + 0
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit+lv_1_bonu)  + u17 + u1k
    lv_0_bonus_2 = unit*0.5 + (u1k*0.5)*2
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*3 + 4000 + 750
    puts "arrange11e：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end

def arrange_12
    unit = @ben*@apollo_rate_2
    # 不算社区的基本收入
    basic_income = unit*3 + unit*6
    # 第1代的社区奖金(分享3人拿1代100%，2代50%)
    lv_1_bonu = unit*3 + 0 + 0
    lv_1_bonus = lv_1_bonu
    # 第0代的社区奖金(分享3人拿1代100%，2代50%)
    lv_0_bonus_1 = (unit+lv_1_bonu) + unit + unit
    lv_0_bonus_2 = (unit*0.5)*3
    lv_0_bonus = lv_0_bonus_1 + lv_0_bonus_2
    # 总收入(美元)
    total = basic_income+lv_1_bonus+lv_0_bonus
    invest = @ben*9
    puts "arrange_12：投资：$#{invest} 收入：¥#{(total*@usd_rate/30).to_i}/#{(total*@usd_rate).to_i} (#{(total/@wor_rate/30).to_i}/#{(total/@wor_rate).to_i} wor) #{format("%.1f", invest/total)}个月回本"
end


def cal_total_wor( btcs, price = 6000 )
    wors = []
    # 不算社区的基本收入
    btcs.each_with_index do |u, i|
        if u*price >= 5000
            wors[i] = u*price*@apollo_rate_2/30/@wor_rate
       elsif u*price >= 1000
            wors[i] = u*price*@apollo_rate_1/30/@wor_rate
      else
            wors[i] = 0
    end
        #puts "#{format('%.4f',wors[i])} wor"
    end
    # 第3代的总利息
    lv_3_lixi = wors[7]+wors[8]+wors[9]
    # 第2代的社区奖金--看第3代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_2_bonus = lv_3_lixi*1.0
    # 第1代的社区奖金--看第2代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_2_lixi = wors[4]+wors[5]+wors[6]
    lv_1_bonus_1 = lv_2_lixi*1.0
    lv_1_bonus_2 = lv_3_lixi*0.5
    # 第0代的社区奖金--看第1代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_1_lixi = wors[1]+wors[2]+wors[3]
    lv_0_bonus_1 = lv_1_lixi*1.0
    lv_0_bonus_2 = lv_2_lixi*0.5
    lv_0_bonus_3 = lv_3_lixi*0.3
    wors[0] += lv_0_bonus_1 + lv_0_bonus_2 + lv_0_bonus_3
    wors[1] += lv_1_bonus_1 + lv_1_bonus_2
    wors[4] += lv_2_bonus
    # 总收入(美元)
    total = wors.sum*@wor_rate
    puts "收入：¥#{(total*@usd_rate).to_i}/#{(total*@usd_rate*30).to_i} (#{(total/@wor_rate).to_i}/#{(total/@wor_rate*30).to_i} wor)"
end

@btcs = [1,1,0.3298,0.2,0.2,0.2,1,1,0.8692,0.8366]
cal_total_wor @btcs
# buy 0.1308 btc to no.9
@btcs[8] += 0.1308*15
cal_total_wor @btcs
# buy 0.1308 btc to no.3
@btcs[2] += 0.1308*15
@btcs[8] = 0.8692
cal_total_wor @btcs

# arrange_1
# arrange_2
# arrange_3
# arrange_4
# arrange_5
# arrange_6
# arrange_7
# arrange_8
# arrange_9
# arrange_10
# arrange10a
# arrange10b
# arrange11a
# arrange11b
# arrange11c
# arrange11g
# arrange11f
# arrange11h
# arrange11i
# arrange11j
# arrange11k
# arrange11l
# arrange11m
# arrange11d
# arrange11e
# arrange_12

=begin
########## 参数设定 ##########
# 初始本金(美元)
@begin_ben_jing = 0 # 2019-6-1 之前以WOR获利偿还本金 95000 CNY 只要 7000 WOR > 95000 CNY 即 1 WOR > 13.57 CNY
# 开始日、结束日、经过天数
@begin_date = "2019-6-1".to_date # Apollo: @ben*9 布局完成
@end_date = "2020-7-15".to_date # 必须大于 250万房价+10万还太平+20万还新光 = 280万
# 只显示结果
@only_result = true
# 美元汇率、WOR兑换美元汇率
@usd_rate = 6.7182
@wor_rate = 0.3825
# 每日资产增值率
@day_rate = 0.1/30
# WOR每月增值率
@wor_grow_rate = 0.07
# 比特币每月增值率
@btc_grow_rate = 0.07
#每隔几天显示结果
@show_pre_days = 1

########## 公用函数 ##########
# 试算并显示投资效益
def show_invest_result( mode = :all, only_result = true )
    # 初始化参数
    w_total_lixi = w_this_lixi = w_total_wor = w_this_wor = w_this_benlihe = w_this_huo_li = 0
    g_total_lixi = g_this_lixi = g_total_wor = g_this_wor = g_this_benlihe = g_this_huo_li = g_pre_lixi = g_pre_wor = 0
    w_ben_jing = g_ben_jing = @begin_ben_jing
    w_wor_rate = g_wor_rate = @wor_rate
    w_title = "累积币"
    g_title = "利滚利"
    n = 0
    (@begin_date..@end_date).each do |this_day|
        # 当天的利息
        w_this_lixi = w_ben_jing*@day_rate
        # 当天得到的WOR
        w_this_wor = w_this_lixi/w_wor_rate
        # 累积的利息和WOR
        w_total_lixi += w_this_lixi
        w_total_wor += w_this_wor
        # 当天的资产总和
        w_this_benlihe = w_ben_jing + w_total_lixi
        # 当天的累计获利
        w_this_huo_li = (w_this_benlihe - @begin_ben_jing)*@usd_rate
        # 当天的本金 = 原始本金 + 上一期的收益
        g_ben_jing += g_pre_lixi
        g_total_lixi -= g_pre_lixi
        # 当天的利息
        g_this_lixi = g_ben_jing*@day_rate
        # 当天得到的WOR
        g_this_wor = g_this_lixi/g_wor_rate
        # 累积的利息和WOR
        g_total_lixi += g_this_lixi
        g_total_wor = g_total_lixi/g_wor_rate
        # 当天的资产总和
        g_this_benlihe = g_ben_jing + g_total_lixi
        # 当天的累计获利
        g_this_huo_li = (g_this_benlihe - @begin_ben_jing)*@usd_rate
        # 更新上一期的收益
        g_pre_lixi = g_this_lixi
        # 按照设定的间隔数显示结果
        if  (!only_result and n % @show_pre_days == 0) or (only_result and this_day == @end_date)
            puts "第 #{(this_day-@begin_date).to_i} 天：#{@begin_date} ~ #{this_day}\n"
            if mode == :wor
                eval(show_result_str.gsub('mode_','w_'))
            elsif mode == :lgl
                eval(show_result_str.gsub('mode_','g_'))
            elsif mode == :all
                eval(show_result_str.gsub('mode_','w_'))
                eval(show_result_str.gsub('mode_','g_'))
            end
        end
        # 计算下一次的本金与WOR兑换美元汇率
        w_ben_jing = w_ben_jing*(1+@btc_grow_rate/30)
        g_ben_jing = g_ben_jing*(1+@btc_grow_rate/30)
        w_wor_rate = w_wor_rate*(1+@wor_grow_rate/30)
        g_wor_rate = g_wor_rate*(1+@wor_grow_rate/30)
        n += 1
    end
end

def show_result_str
    'puts "#{mode_title}资产：#{mode_ben_jing.to_i} USD 月入：#{(mode_this_lixi*@usd_rate*30).to_i} CNY 当日：#{format("%.1f", mode_this_wor)} WOR $#{format("%.1f", mode_this_lixi)} 总收益：#{format("%.1f", mode_total_wor)} WOR $#{format("%.1f", mode_total_lixi)} 总获利：#{format("%.0f", mode_this_huo_li)}"'
end

################################################################################################

total = 95000 + 201300
goal = 5200
cost = (77500+(7500*((1083.825-407.34016111)/1083.825)))
units = 2.5989 + 0.02597055 - 0.0005
usd_rate = 6.71
wor_rate = 0.3825
mini_ave_price = 5000
month_income = goal*units*0.1*usd_rate

def puts_result
    'puts "已投入本金：#{cost.to_i} (#{(cost/usd_rate).to_i}) 占比 #{format("%.2f",cost.to_f/total*100)}% 总量：#{format("%.8f",units)} BTC"
     puts "已购买均价：#{format("%.2f",cost/units/usd_rate)} (最好小于#{mini_ave_price})"
     puts "预估月收入：#{month_income.to_i} (BTC: #{goal} Apollo: #{(goal*units).to_i}) #{(month_income/30).to_i} $#{(month_income/30/usd_rate).to_i} (#{(month_income/30/usd_rate/wor_rate).to_i} WOR) /日"'
end

eval(puts_result)

remain = (total-cost).to_i
puts "----- 剩余资金 #{remain} 分批购买 -----"

prices = [5110, 5150, 5150, 5200]
# @ben*3 CNY = 2173.9130 USD  (6.90 CNY/USDT)
# 10000 CNY = 1449.2753 USD (6.90 CNY/USDT)
costs = [407, 724, 725, 30000] 
prices.each.with_index do |price, i|
    if costs[i] > 0 
        new_unit = costs[i]/price.to_f - 0.0005 - 0.0001 # 交易费
    else
        new_unit = 0
    end
    units += new_unit
    cost += (costs[i] + 0.0005 + 0.0001)*usd_rate
    puts  "以 #{costs[i]} 元 购入价格为 #{price} 的 BTC #{format("%.8f", new_unit)} 个，BTC 总数为 #{format("%.8f", units)}，成本为 #{cost.to_i}，均价为 #{format("%.2f", cost/usd_rate/units)}"
end

# price = 5020
# puts "--------若以市价 #{price} 直接全部购买--------"
# units = units + (95000-cost)/usd_rate/price
month_income = goal*units*0.1*usd_rate
eval(puts_result)

####################################################
@begin_ben_jing = (goal*units).to_i
# @begin_date = "2019-6-1".to_date
# @end_date = "2020-6-30".to_date
show_invest_result(:all, @only_result)
=end