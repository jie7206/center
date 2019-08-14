require 'rails'

########## 参数设定 1 ##########
# 预计总投入金额
@total_invest = 95000 + 201300
# BTC 的预期目标价
@goal_btc_price = 5300
# 已经投入的总资本
@already_pay = (77500+(7500*((1083.825-202.74016111)/1083.825)))
# 已持有的BTC总数
@total_units = 2.6244 + 0.03838736
# 美元汇率、WOR兑换美元汇率
@usd_rate = 6.7182
@begin_wor_rate = 0.3825
# 阿波罗机器人每月收益(0.1=10%)
@apllo_rate = 0.1
# 期望的最低均价
@mini_ave_price = 5000
# 预估每月的收入
@month_income = @goal_btc_price*@total_units*@apllo_rate*@usd_rate
########## 参数设定 2 ##########
# 初始本金(美元)
@begin_ben_jing = 0 # 2019-6-1 之前以WOR获利偿还本金 95000 CNY 只要 7000 WOR > 95000 CNY 即 1 WOR > 13.57 CNY
# 开始日、结束日、经过天数
@begin_date = Date.today
@end_date = Date.today + 365.days
# 只显示结果
@only_result = true
# 每日资产增值率
@day_rate = @apllo_rate/30
# WOR每月增值率
@wor_grow_rate = 0.07
# 比特币每月增值率
@btc_grow_rate = 0.07
#每隔几天显示结果
@show_pre_days = 1

########## 公用函数 ##########

# 试算并显示投资效益
def show_invest_result( begin_ben_jing, begin_date, end_date, only_result = true, mode = :all )
    # 初始化参数
    w_total_lixi = w_this_lixi = w_total_wor = w_this_wor = w_this_benlihe = w_this_huo_li = 0
    g_total_lixi = g_this_lixi = g_total_wor = g_this_wor = g_this_benlihe = g_this_huo_li = g_pre_lixi = g_pre_wor = 0
    w_ben_jing = g_ben_jing = begin_ben_jing
    w_wor_rate = g_wor_rate = @begin_wor_rate
    w_title = "累积币"
    g_title = "利滚利"
    n = 0
    begin_date = begin_date.to_date
    end_date = end_date.to_date
    (begin_date..end_date).each do |this_day|
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
        w_this_huo_li = (w_this_benlihe - begin_ben_jing)*@usd_rate
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
        g_this_huo_li = (g_this_benlihe - begin_ben_jing)*@usd_rate
        # 更新上一期的收益
        g_pre_lixi = g_this_lixi
        # 按照设定的间隔数显示结果
        if  (!only_result and n % @show_pre_days == 0) or (only_result and this_day == end_date)
            puts "第 #{(this_day-begin_date).to_i} 天：#{begin_date} ~ #{this_day}\n"
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

def puts_result
    'puts "已投入本金：#{@already_pay.to_i} (#{(@already_pay/@usd_rate).to_i}) 占比 #{format("%.2f",@already_pay.to_f/@total_invest*100)}% 总量：#{format("%.8f",@total_units)} BTC"
     puts "已购买均价：#{format("%.2f",@already_pay/@total_units/@usd_rate)} (最好小于#{@mini_ave_price})"
     puts "预估月收入：#{@month_income.to_i} (BTC: #{@goal_btc_price} Apollo: #{(@goal_btc_price*@total_units).to_i}) #{(@month_income/30).to_i} $#{(@month_income/30/@usd_rate).to_i} (#{(@month_income/30/@usd_rate/@begin_wor_rate).to_i} WOR) /日"'
end

# 显示目前BTC的投资状况
def show_btc_status
        eval(puts_result)
end

# 显示BTC分批购买的结果预测
def show_buy_plan
        puts "----- 剩余资金 #{(@total_invest-@already_pay).to_i} 分批购买 -----"
        prices = [5100, 5150, 5150, 5200]
        costs = [202, 724, 725, 30000] 
        prices.each.with_index do |price, i|
            if costs[i] > 0 
                new_unit = costs[i]/price.to_f - 0.0005 - 0.0001 # 交易费
            else
                new_unit = 0
            end
            @total_units += new_unit
            @already_pay += (costs[i] + 0.0005 + 0.0001)*@usd_rate
            puts  "以 #{costs[i]} 元 购入价格为 #{price} 的 BTC #{format("%.8f", new_unit)} 个，BTC 总数为 #{format("%.8f", @total_units)}，成本为 #{@already_pay.to_i}，均价为 #{format("%.2f", @already_pay/@usd_rate/@total_units)}"
        end
        @month_income = @goal_btc_price*@total_units*@apllo_rate*@usd_rate
        eval(puts_result)
end

########## 调用函数 ##########

show_btc_status
show_buy_plan
show_invest_result(@goal_btc_price*@total_units,  Date.today, "2020-12-31", @only_result)