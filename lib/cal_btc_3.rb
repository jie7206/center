require 'rails'

# 美元汇率、WOR兑换美元汇率
@usd_rate = 6.8737
@twd_rate = 4.5313
@twd_usd_rate = 31.147
@wor_rate = 0.3825
# 今日比特币价格
@today_price = 10700
# 已贷款总额度
@add_cost = 0
@add_unit = 0
@jinruyi = 1118237
@jinruyi_start = "2019-5-20".to_date
@jinruyi_back = "2019-12-18".to_date
# 总投资成本
@total_cost = 1229900
# 每月资产增值率
@apollo_rate_1 = 0.0700
@apollo_rate_2 = 0.0935
# 已经拥有的WOR总数
@wors = 17379.1907
# 理想的币价(人民币)
@ideal_wor_price = 800
# 目前各钱包拥有的比特币
@btcs = [
                    0.0, #135-6025
                    0.1214, #170-1026 4.3206*0.99=4.277394 ETH
                    0, # 134-4219
                    0, # 133-7043
                    0, # 157-0291
                    0.0, # 152-9412
                    0.125235, # 152-9421
                    0, # 157-0053
                    0.0, # 182-3260
                    0.0  # 182-3283
                ]
# 投资试算结束日
@end_date = Date.today + 1.year
# 比特币月增值率
@btc_grow_rate = 0.04

def cal_total_wor( btcs, price )
    wors = []
    # 不算社区的基本收入
    btcs.each_with_index do |u, i|
      if u*price >= 5000
        wors[i] = u*price*@apollo_rate_2/30/@wor_rate
      elsif u*price > 0
        wors[i] = u*price*@apollo_rate_1/30/@wor_rate
      else
        wors[i] = 0
      end
    end
    # 第3代的总利息
    lv_3_lixi = wors[7]+wors[8]+wors[9]
    # 第2代的社区奖金--看第3代总利息(分享3人拿1代100%，2代50%，3代30%)
    n2 = 0
    (7..9).each do |i|
      n2 += 1 if wors[i] > 0
    end
    # 分享1人 50%, 分享2人 80%, 分享3人 100%
    m2 = 0
    case n2
      when 1
        m2 = 0.5
      when 2
        m2 = 0.8
      when 3
        m2 = 1.0
    end
    lv_2_bonus = lv_3_lixi*m2
    # 第1代的社区奖金--看第2代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_2_lixi = wors[4]+wors[5]+wors[6]
    n1 = 0
    (4..6).each do |i|
      n1 += 1 if wors[i] > 0
    end
    # 分享1人 50%, 分享2人 80%, 分享3人 100% => m11
    # 分享2人拿 1代80% 2代50%，分享3人拿 1代100% 2代50% 3代30% => m12, m13
    m11 = m12 = m13 = 0
    case n1
      when 1
        m11 = 0.5
      when 2
        m11 = 0.8
        m12 = 0.5
      when 3
        m11 = 1.0
        m12 = 0.5
        m13 = 0.3
    end
    lv_1_bonus_1 = lv_2_lixi*m11
    lv_1_bonus_2 = lv_3_lixi*m12
    # 第0代的社区奖金--看第1代总利息(分享3人拿1代100%，2代50%，3代30%)
    lv_1_lixi = wors[1]+wors[2]+wors[3]
    n0 = 0
    (1..3).each do |i|
      n0 += 1 if wors[i] > 0
    end
    # 分享1人 50%, 分享2人 80%, 分享3人 100% => m11
    # 分享2人拿 1代80% 2代50%，分享3人拿 1代100% 2代50% 3代30% => m12, m13
    m01 = m02 = m03 = 0
    case n0
      when 1
        m01 = 0.5
      when 2
        m01 = 0.8
        m02 = 0.5
      when 3
        m01 = 1.0
        m02 = 0.5
        m03 = 0.3
    end
    lv_0_bonus_1 = lv_1_lixi*m01
    lv_0_bonus_2 = lv_2_lixi*m02
    lv_0_bonus_3 = lv_3_lixi*m03
    wors[0] += lv_0_bonus_1 + lv_0_bonus_2 + lv_0_bonus_3 if btcs[0] > 0
    wors[1] += lv_1_bonus_1 + lv_1_bonus_2 if btcs[1] > 0
    wors[6] += lv_2_bonus if btcs[6] > 0
    return wors, wors.sum
end

def cal_wors_after_days
    price = @today_price
    @wors_arr, wors = cal_total_wor(@btcs, price)
    day_income = (wors*@wor_rate*@usd_rate).to_i
    month_income = day_income*30
    lixi_rate = month_income/@total_cost.to_f*100
    puts "第一天估计能挖#{format("%.4f", wors)}个WOR，每日收入：¥#{day_income}，每月收入：¥#{month_income}，月利率：#{format("%.2f", lixi_rate)}%"
    ((Date.today+1.day)..@end_date).each do |this_day|
        @wors += cal_total_wor(@btcs, price)[1]
        price += price*@btc_grow_rate/30
    end
    puts "从今起直到#{@end_date}估计能挖#{@wors.to_i}个WOR，合#{(@wors*@wor_rate).to_i}美元，#{(@wors*@wor_rate*@usd_rate).to_i}人民币，币价升至#{@ideal_wor_price}，合人民币#{(@wors*@ideal_wor_price).to_i}"
end

@jinruyi_lixi = ((@jinruyi_back-@jinruyi_start).to_i * (@jinruyi*0.065/365)).to_i
@jinruyi = @jinruyi + @jinruyi_lixi - 300000
#puts "#{@jinruyi_back} 贷款余额：#{@jinruyi}"
puts "比特币总数：#{format("%.8f",@btcs.sum)}，现价：#{@today_price}"
cal_wors_after_days
puts "WOR分布：" + @wors_arr.map {|n| format("%.4f",n)}.join(",")
=begin
[Back]
2019-12-18 贷款余额：860454
比特币总数：7.13253069，现价：8000
第一天估计能挖1043.4800个WOR，收入：12431/372930，月利率：30.32%
从今起直到2019-05-31估计能挖27940个WOR，合10687美元，73459人民币，币价升至500，合人民币13970051

[Now]
2019-12-18 贷款余额：860454
比特币总数：7.11955453，现价：8000
第一天估计能挖1138.4696个WOR，收入：13563/406890，月利率：33.08%
从今起直到2019-05-31估计能挖28901个WOR，合11054美元，75987人民币，币价升至500，合人民币14450739

[1->9:0.8] +2.63%
2019-12-18 贷款余额：860454
比特币总数：7.06950569，现价：8000
第一天估计能挖1168.7314个WOR，收入：13923/417690，月利率：33.96%
从今起直到2019-05-31估计能挖29207个WOR，合11171美元，76792人民币，币价升至500，合人民币14603877

[1->9:0.82] +2.80%
2019-12-18 贷款余额：860454
比特币总数：7.06950569，现价：8000
第一天估计能挖1170.4297个WOR，收入：13944/418320，月利率：34.01%
从今起直到2019-05-31估计能挖29224个WOR，合11178美元，76837人民币，币价升至500，合人民币14612471

[1->9:0.8, 6->7:0.8] +2.81%
2019-12-18 贷款余额：860454
比特币总数：7.01952953，现价：8000
第一天估计能挖1170.0883个WOR，收入：13940/418200，月利率：34.00%
从今起直到2019-05-31估计能挖29221个WOR，合11177美元，76828人民币，币价升至500，合人民币14610743
=end
