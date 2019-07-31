class Fixnum

    # 将人民币转成新台币
    def rmb_to_ntd
        ( self * value_of("exchange_rates_MCY").to_f ).round
    end

    # 将人民币转成美元
    def rmb_to_usd
        ( self * (value_of("exchange_rates_MCY").to_f/value_of("exchange_rates_USD").to_f) ).round
    end

    # 将美元转成人民币
    def usd_to_rmb
        ( self * (value_of("exchange_rates_USD").to_f/value_of("exchange_rates_MCY").to_f) ).round
    end

    # 将新台币转成人民币
    def ntd_to_rmb
        ( self * (value_of("exchange_rates_NTD").to_f/value_of("exchange_rates_MCY").to_f) ).round
    end

    # 将新台币转成美元
    def ntd_to_usd
        ( self * (value_of("exchange_rates_NTD").to_f/value_of("exchange_rates_USD").to_f) ).round
    end

end

    def sex_arr
        [[ '男', 1 ],[ '女', 0 ]]
    end

    def classification_arr
        [ ['核心會員','1'],['新增會員','2'],['一般會員','3'],['登記會員','5'],['休眠會員','6'],['慕道學員','4'],['不列计算','0']]
    end

    def career_arr
        [ ['祝福會員','0'],['二世','5'],['群眾','99'],['單身公職','3'],['學生會員','1'],['職工會員','2'],['學生學員','6'],['職工學員','7']]
    end

    def career_arr_for_guest
        [ ['单身公职','3'],['學生會員','1'],['職工會員','2'],['學生學員','6'],['職工學員','7'],['群眾','99']]
    end

    def g2_age_arr
        [ [0,12], [13,18], [19,199] ] #[ [二世-小学年龄区间], [二世-中学年龄区间] ]
    end

    def area_arr
        [ ['親友',99],['中華',0],['中國',1],['北京',2],['上海',3],['廣州',4],['武漢',5],['山东',16],['大連',6],['珠海',13],['天津',7],['廈門',8],['香港',15],['台灣',14],['官校',10],['韩国',9],['日本',11],['菲律宾',12]]
    end

    def status_arr
        [ ['學習原理',0],['學習信仰',1],['禮拜奉獻',2],['信仰條件',3],['動員獻身',4],['海外募金',5],['韓國培訓',6],['開拓中心',7],['建立家庭',8]]
    end

    def star_arr
        [ ['幾乎沒來[1顆星]','1.0'],['偶而會來[2顆星]','2.0'],['定期會來[3顆星]','3.0'],['信仰穩定[3星半]','3.5'],['分擔使命[4顆星]','4.0'],['核心成員[4星半]','4.5'],['核心領導[5顆星]','5.0']]
    end

    def question_catalogs
      [ ['原理問題','0'],['個性問題','1'],['帶領問題','2'],['生活問題','3'],['建議事項','4']]
    end

    def roles_arr
      [ ['網站管理員','admin'],['愛心小組長','team_leader']]
    end

    def school_arr
        [ ['北大','0'],['清華','1'],['北航','2'],['農大','3'],['地大','4'],['林大','5'],['科大','6'],['人文','7'],['復旦','8']]
    end

    def class_type_arr
        [ ['训读会','read'],['小组分享','sunday_service'],['二世礼拜','sunday_service_2g'],['室内活动','indoor'],['户外活动','outdoor'],['培训活动','training'],['一般讲课','normal'],['半日讲课','half'],['一日灵修','1day'],['两日灵修','2day'],['三日灵修','3day'],['四日灵修','4day'],['七日灵修','7day'],['十日灵修','10day'],['個別陪談','link'],['個別解惑','answer'],['養育課程','parenting'],['电话联系','tel'],['短信分享','wenxin'],['小组团契','association'],['小组会议','meeting'],['闲聊叙旧','keep_friendship']]
    end

    def main_teachers
      ['彭小鵬', '林仕傑', '洗敏瑩', '郭奕辰']
    end

    def activity_peroid_arr
      [ ['本月',0],['本季',3],['半年',6],['一年',12],['兩年',24],['三年',36] ]
    end

    def donation_catalog_arr
      [ ['十一奉献',1],['住宿奉献',4],['节日奉献',3],['感谢奉献',5],['特别奉献',6],['万物复归',7],['礼拜奉献',2] ]
    end

    def asset_belongs_to_arr
      [ ['自家資產',1],['中心資產',2] ]
    end

    def currency_arr
      [ ['人民幣','MCY'],['新台幣','NTD'],['美元','USD'],['韓圜','KRW'],['HUSD','HUSD']]
    end

    def day_diff( from_time, to_time = 0, include_seconds = false )
        from_time = from_time.to_time if from_time.respond_to?(:to_time)
        to_time = to_time.to_time if to_time.respond_to?(:to_time)
        return (((to_time - from_time).abs)/86400).round
    end

    # 计算利息时的天数之差 logger.info "diff=#{day_diff( from_time, to_time - 2.days )}"
    def day_diff_for_loan( from_time, to_time, fix_days = 2 )
      to_time -= fix_days.days
      return (DateTime.parse(to_time.to_s)-DateTime.parse(from_time.to_s)).abs.to_i
    end

    def month_diff( from_time, to_time = 0, include_seconds = false )
        from_time = from_time.to_time if from_time.respond_to?(:to_time)
        to_time = to_time.to_time if to_time.respond_to?(:to_time)
        return (((to_time - from_time).abs)/(86400*31)).round
    end

    def year_diff( from_time, to_time = 0, include_seconds = false )
        from_time = from_time.to_time if from_time.respond_to?(:to_time)
        to_time = to_time.to_time if to_time.respond_to?(:to_time)
        return (((to_time - from_time).abs)/(86400*31*12)).round
    end

    def get_min_item_catalog_id
        LifeCatalog.first( :conditions => ["goalable = ?",true], :order => "total_minutes" ).id
    end

    def remain_minutes_of_life_catalog( cid )
        life_catalog = LifeCatalog.first( :include => :life_items, :conditions => [ "id = ?", cid ] )
        total_minutes_of_today = 0
        life_catalog.life_items.each do |life_item|
        	if use_life_catalog_goal_minutes?
	              life_records = LifeRecord.all( :conditions => ["life_item_id = ? AND rec_date = ? AND is_not_goal != ?",  life_item.id, Date.today.to_s(:db), true] )
	              life_records.each { |r| total_minutes_of_today += r.used_minutes } if not life_records.empty?
    		else
	          if life_item.is_goal
	              total_minutes_of_this_item = 0
	              life_records = LifeRecord.all( :conditions => ["life_item_id = ? AND rec_date = ? AND is_not_goal != ?",  life_item.id, Date.today.to_s(:db), true] )
	              life_records.each { |r| total_minutes_of_this_item += r.used_minutes } if not life_records.empty?
	              total_minutes_of_this_item = life_item.goal_minutes if life_item.goal_minutes.to_i > 0 and total_minutes_of_this_item > life_item.goal_minutes
	              total_minutes_of_today += total_minutes_of_this_item
	          end
      		end
        end
        life_catalog_total_goal_minutes = life_catalog.total_goal_minutes
        remain_minutes = life_catalog_total_goal_minutes - total_minutes_of_today
        remain_minutes_percent = remain_minutes.to_f / life_catalog_total_goal_minutes
        return { :catalog_name => life_catalog.name, :remain_minutes => remain_minutes, :remain_minutes_percent => remain_minutes_percent }
    end

    def remain_minutes_of_life_item( item_id )
        life_item = LifeItem.find(item_id)
		total_minutes_of_this_item = 0
	    life_records = LifeRecord.all( :conditions => ["life_item_id = ? AND rec_date = ? AND is_not_goal != ?",  item_id, Date.today.to_s(:db), true] )
	    life_records.each { |r| total_minutes_of_this_item += r.used_minutes } if not life_records.empty?
	    total_minutes_of_this_item = life_item.goal_minutes if life_item.goal_minutes.to_i > 0 and total_minutes_of_this_item > life_item.goal_minutes

        remain_minutes = life_item.goal_minutes - total_minutes_of_this_item
        remain_minutes_percent = remain_minutes.to_f / life_item.goal_minutes
        return { :item_name => life_item.name, :remain_minutes => remain_minutes, :remain_minutes_percent => remain_minutes_percent }
    end

	def add_date_to_all_goal_of_today_completed_data( rec_date )
		param = Param.find_by_name('all_goal_of_today_completed_data')
		all_goal_of_today_completed_arr = param.content.split(",")
		rec_date.gsub!('-','')
		if not all_goal_of_today_completed_arr.include?( rec_date )
		    all_goal_of_today_completed_arr << rec_date
		    param.update_attributes( :value => all_goal_of_today_completed_arr.size, :content => all_goal_of_today_completed_arr.join(",") )
		end
	end

	def use_life_catalog_goal_minutes?
		value = Param.find_by_name('use_life_catalog_goal_minutes').value
		value == "true" ? true : false
	end

	def exe_update_life_catalog_total_minutes ( cid = [] )
  	life_catalogs = LifeCatalog.all( :conditions => "id in ( #{cid.join(",")} )", :include => :life_items )
  	life_catalogs.each do |life_catalog|
  		total_minutes = 0
  		life_catalog.life_items.each { |t| total_minutes += t.total_minutes }
  		life_catalog.update_attribute( :total_minutes, total_minutes )
  	end
  end

  def sum_by_cid_select( cid )
    [ "career = ?", cid]
  end

  def sum_by_cid_and_aid_select( cid, aid )
    [ "career = ? and area_id = ?", cid, aid ]
  end

  def total_local_count_select( aid )
    [ "career != 99 and area_id = ?", aid ]
  end

  def total_local_effect_count_select( aid )
    [ "classification != '4' and area_id = ?", aid ]
  end

  def total_local_leader_count_select( aid )
    [ "is_core_leader = ? and career != 99 and area_id = ?", true, aid ]
  end

  def total_local_staff_count_select( aid )
    [ "is_staff = ? and career != 99 and area_id = ?", true, aid ]
  end

  def total_local_family_count_select( aid )
  	[ "sex_id = ? and career = '0' and area_id = ?", 1, aid ]
  end

  def total_local_core_family_count_select( aid )
    [ "is_core_family = ? and area_id = ?", true, aid ]
  end

  def total_local_core_members_count_select( aid )
    [ "classification = ? and area_id = ?", '1', aid ]
  end

  def total_local_disconnect_members_count_select( aid )
    [ "( career != '5' and career != '99' ) and classification = ? and area_id = ?", '4', aid ]
  end

  def total_local_single_members_count_select( aid )
    [ "( career = '1' or career = '2' or career = '3' or career = '5' ) and area_id = ?", aid ]
  end

  def total_count_select
    "career != '99'"
  end

  def db_total_count_select
  	"members.id > 0"
	end

  def is_on_table_count_select
    [ "career != '99' and is_on_table = ?", true]
  end

  def is_brother_count_select( aid )
    [ "sex_id = ? and birthday_still_unknow = ? and birthday > ? and area_id = ? and career != ? and career != ?", 1, false, "1974-12-02".to_date, aid, '5', '99' ]
  end

  def total_local_blessedable_count_select( aid )
    [ "blessedable = ? and career != 99 and area_id = ?", true, aid ]
  end

  def total_local_new_count_select( aid )
    [ "classification = '2' and area_id = ?", aid ]
  end

  def linshijie_total_histories_select
    "class_teacher = '林仕傑' and name != '林仕傑'"
  end

  def life_interest_select
    "name like 'life_interest_%'"
  end

  def life_catalog_select
    "name like 'life_catalog_%'"
  end

  def add_zero( num, pos = 3 )
    if num.to_i > 0
      result = num.to_s
      case pos
        when 4
          if num < 1000 and num >=100
            result = "0"+result
          elsif num < 100 and num >=10
            result = "00"+result
          elsif num < 10
            result = "000"+result
          end
        when 3
          if num < 100 and num >=10
            result = "0"+result
          elsif num < 10
            result = "00"+result
          end
        when 2
          if num < 100 and num >=10
          elsif num < 10
            result = "0"+result
          end
      end
      return result
    else
      return "0"*pos
    end
  end

  def value_of( param_name )
    Param.find_by_name(param_name).value
  end

  def title_of( param_name )
    Param.find_by_name(param_name).title
  end

  def content_of( param_name )
    Param.find_by_name(param_name).content
  end

  def trip_title( title )
    return title.sub('【','').sub('】','')
  end

  # 如果全部都完成後，將其重置為全部沒有完成
  def check_if_all_pass_then_reset
    life_goals_reset_everyday = value_of('life_goals_reset_everyday').to_i
    # 如果设定为"每日重头开始"，亦即只要是新的一天(定义是所有记录中最近完成日找不到一笔是今天的)，则重设目标(完成0分，已完成为假)
    if life_goals_reset_everyday > 0 and !LifeGoal.last( :order => "order_num", :conditions => [ "updated_at >= '#{Date.today.to_s(:db)}' and is_pass = ? and is_todo = ? and is_show = ?", true, false, true ] )
      exe_reset_life_goals #完成0分，已完成为假
    # 如果设定为"每日重头开始"，但是没有一项完成----待开发！
    # 如果全部通过且日期不为今日--(如果找不到任何一项没有通过的生活目标，就看最后一项生活目标的最近完成日是不是今天，如果不是则更新)
    elsif !LifeGoal.find_by_is_pass_and_is_todo_and_is_show(false,false,true) and LifeGoal.last( :order => "order_num", :conditions => [ "pass_date != '#{Date.today.to_s(:db)}' and is_todo = ? and is_show = ?", false,true ] )
      exe_reset_life_goals
    end
  end

  # 执行生活目标的归零重置
  def exe_reset_life_goals
    LifeGoal.update_all( ["is_pass = ?", false], ["is_todo = ?", false] )
    LifeGoal.update_all( "completed_minutes = 0", ["is_todo = ?", false] )
  end

  # 会员列表的预设排序
  def default_order_for_member_list
    'members.classification,members.sex_id,members.birthday'
  end

  # 避免超出索引值
  def check_index_boundary( index, size )
    if index <= -1
      return size-1
    else
      return index >= size ? 0 : index
    end
  end

  # 回传资料夹内包含match_str字串的档名
  def get_file_names( folder_path, match_str )
    result = []
    Dir.glob(Rails.root+folder_path+"*#{match_str}*.jpg").each do |filefullname|
      result << filefullname.sub(Rails.root+folder_path,'').sub('.jpg','')
    end
    return result
  end

  # 计算某项资产的总值
  def sum_money_of( assets_code, currency = 'NTD', asset_belongs_to_id = 1, keyword = '', is_emergency = false, only_currency = '' )
    if not keyword.empty?
      asset_item_records = AssetItem.all( :include => :asset, :conditions => ["assets.code = ? and asset_belongs_to_id = ? and asset_items.title like '%"+keyword+"%'", assets_code, asset_belongs_to_id] )
    # 取出可用于紧急预备金的资产项目
    elsif is_emergency
      asset_item_records = AssetItem.all( :include => :asset, :conditions => ["assets.code = ? and asset_belongs_to_id = ? and is_emergency = ?", assets_code, asset_belongs_to_id, true] )
    # 只计算某种币别的资产
    elsif not only_currency.empty?
      asset_item_records = AssetItem.all( :include => :asset, :conditions => ["assets.code = ? and asset_belongs_to_id = ? and currency = ?", assets_code, asset_belongs_to_id, only_currency] )
    else
      asset_item_records = AssetItem.all( :include => :asset, :conditions => ["assets.code = ? and asset_belongs_to_id = ?", assets_code, asset_belongs_to_id] )
    end
    result = 0
    asset_item_records.each do |r|
      case r.currency
        when 'NTD'
          exchange_rate = value_of('exchange_rates_NTD').to_f
        when 'MCY'
          exchange_rate = value_of('exchange_rates_MCY').to_f
        when 'USD'
          exchange_rate = value_of('exchange_rates_USD').to_f
        when 'KRW'
          exchange_rate = value_of('exchange_rates_KRW').to_f
      end
      result += r.amount*exchange_rate
    end
    return result / value_of('exchange_rates_'+currency).to_f
  end

  # 計算中心資產報表參數
  def prepare_center_asset_var
    get_asset_belongs_to_id
    # 流動資產总值
    @total_flow_assets = sum_money_of 'flow_assets', 'MCY', 2
    # 每月支出总额
    @total_month_use = sum_money_of 'month_use', 'MCY', 2
    # 预计收入总额
    @total_plan_get = sum_money_of 'plan_get', 'MCY', 2
    # 预计支出总额
    @total_plan_use = sum_money_of 'plan_use', 'MCY', 2
    # 计算家庭中心流动资产总值
    @total_family_center_assets = sum_money_of 'flow_assets', 'MCY', 2, '[家庭中心]'
    # 计算学生中心流动资产总值
    @total_student_center_assets = sum_money_of 'flow_assets', 'MCY', 2, '[学生中心]'
    # 计算家庭中心每月支出总值
    @total_family_center_month_use = sum_money_of 'month_use', 'MCY', 2, '[家庭中心]'
    # 计算学生中心每月支出总值
    @total_student_center_month_use = sum_money_of 'month_use', 'MCY', 2, '[学生中心]'
    # 计算中心每月收入总值
    @total_center_month_income = sum_money_of 'month_income', 'MCY', 2
    # 資產净值
    @total_net_assets = @total_flow_assets + @total_plan_get - @total_plan_use
    # 若无收入，尚可支持几个月?
    @total_remain_cost_month = @total_net_assets / @total_month_use
  end

  # 計算貸款利息总值
  def get_total_loan_interest_ntd_array( to_time = Time.now )
    total_loan_interests = []
    AssetItem.all(:include => :asset, :conditions => ["assets.code = ? and asset_belongs_to_id = ?", 'loan_items', 1]).each do |item|
      #計算每日利息
      day_interest = item.ntd_amount * (item.loan_interest_rate/100.0) / 365
      #計算已经经过的天数
      pass_days = day_diff_for_loan( item.loan_begin_date, to_time )
      #計算利息
      total_loan_interests << (day_interest * pass_days).round
    end
    return total_loan_interests
  end

  # 計算家庭資產報表參數
  def prepare_my_asset_var
    get_asset_belongs_to_id
    # 距离起日已有几日
    @start_count_date = value_of 'start_count_date'
    @start_count_diff = day_diff( @start_count_date, Time.now )
    # 距离退休还有几日
    @retire_date = value_of 'retire_date'
    @retire_date_diff = day_diff( Time.now - 8.hours, @retire_date )
    # 现金資產总值
    @total_flow_assets_ntd = sum_money_of 'flow_assets'
    @total_flow_assets = sum_money_of('flow_assets', 'NTD', 1)
    # 貸款項目总值
    @total_loan_items = sum_money_of('loan_items', 'NTD', 1)
    # 貸款利息总值
    @total_loan_interests_arr = get_total_loan_interest_ntd_array
    # 貸款本息总值
    @total_loan_value = @total_loan_items + @total_loan_interests_arr.sum.to_i
    # 救急基金总值
    @total_emergency_flow_assets = sum_of_emergency()
    # 每月支出总额
    @total_month_use = sum_money_of('month_use', 'NTD', 1)
    @total_month_use_mcy = @total_month_use / value_of('exchange_rates_MCY').to_f
    # 计算救急基金可以维持家庭开销几个月
    @money_remain_months = sprintf("%0.1f", @total_emergency_flow_assets/@total_month_use.to_i)
    # 预计收入总额
    @total_plan_get = sum_money_of('plan_get', 'NTD', 1)
    # 预计支出总额
    @total_plan_use = sum_money_of('plan_use', 'NTD', 1)
    # 实际可用现金資產總值(不含固定资产)
    @total_net_assets = @total_flow_assets + @total_plan_get - @total_plan_use
    # 流動資產總值
    @total_current_assets = ((@total_flow_assets - @total_plan_use) - @total_loan_value).to_i
    # 固定資產总值
    @total_fixed_assets = sum_money_of('fixed_assets', 'NTD', 1)
    # 資產净值(流動資產總值+固定資產总值)
    @net_asset_value = @total_current_assets + @total_fixed_assets
    # 每月最多能存多少新台币
    @month_save_money_max = value_of('month_save_money_max').to_i * value_of('exchange_rates_MCY').to_f
    # 若无收入，尚可支持几个月?(包含预计的)
    @total_remain_cost_month = @total_net_assets / @total_month_use
    # 若无收入，尚可支持几个月?(不包含预计的)
    @total_remain_cost_month_real = @total_emergency_flow_assets / ( value_of('total_month_use_basic').to_f )
    # 退休后每日的生活费目标(新台币)
    @retire_daily_money = value_of 'retire_daily_money'
    # 台新银行年定存利率
    @year_rate = value_of('taixin_year_rate').to_f
    # 台新银每年定存目标
    @money_save_goals = value_of('money_save_goals').split(',')
    # 计算可列为定存目标的资产项目的总合
    @total_money_for_goal = AssetItem.total_money_for_goal
    # 储蓄目标总值
    @total_goal_money = @retire_daily_money.to_i * @retire_date_diff.to_i
    # 尚需多少资金
    @total_remain_money = (@total_goal_money.to_i - @total_net_assets.to_i)
    # 尚需存款几个月/几年
    @total_remain_save_month = @total_remain_money / @month_save_money_max
    @total_remain_save_year = @total_remain_save_month / 12
    # 取出生活项目总分
    @total_mins_of_life_interest = value_of('count_mins_of_life_interest')
    # 千金難買的天數計算
    @total_days_of_life_interest = sprintf("%0.2f", value_of('count_mins_of_life_interest').to_f / 60 / 24)
    # 已經自由的天數計算
    @free_life_from_date = value_of 'free_life_from'
    @already_free_days = day_diff( @free_life_from_date, Time.now - 8.hours )
    # 三不無影的天數計算
    @three_control_then_free_start_date = value_of 'three_control_then_free_start_date'
    @free_life_from = day_diff( @three_control_then_free_start_date, Time.now - 8.hours )
    @rmb_rate = value_of('exchange_rates_MCY').to_f
  end

  ######################### 以下由模擬系統專用 #########################

  def sim_identity_arr
    [ ['學員','student'],['會員','member'],['祝福會員','blessed_member'],['祝福家庭','blessed_family']]
  end

  def sim_occupation_arr
    [ ['待業',0],['學生',1],['職工',2],['動員',3],['公職者',4],['指導者',5] ]
  end

  def sim_blessing_arr
    [ ['1800對',10],['6500對',20],['3萬對(1992)',30],['36萬對(1995)',40],['360萬對(1997)',45],['4000萬對(1998)',50],['3億6千萬對(1999)',60],['4億對第1次(2000)',70],['4億對第2次(2001)',80],['4億對第3次(2002)',90],['4億對第4次(2003)',100],['4億對第5次(2004)',110],['4億對第6次(2005)',120],['2005.8國際祝福式',125],['2005國際交叉祝福',130],['2009國際祝福式',140],['2010國際祝福式',150],['2011國際祝福式',160],['2012國際祝福式',170],['2013國際祝福式',180],['2014國際祝福式',190],['2015國際祝福式',200],['2016國際祝福式',210],['2017國際祝福式',220],['2018國際祝福式',230],['2019國際祝福式',240],['2020國際祝福式',250],['2021國際祝福式',260],['2022國際祝福式',270] ]
  end

  def sim_school_name_arr
    [ ['北京大学','1'],['清华大学','2'],['中国人民大学','3'],['北京师范大学','4'],['北京航空航天大学','5'],['北京理工大学','6'],['中国农业大学','7'],['北京协和医学院','8'],['北京科技大学','9'],['北京交通大学','10'],['北京邮电大学','11'],['中国政法大学','12'],['北京化工大学','13'],['中央财经大学','14'],['中央民族大学','15'],['北京林业大学','16'],['对外经济贸易大学','17'],['华北电力大学','18'],['北京工业大学','19'],['首都师范大学','20'],['其他學校','99'] ]
  end

  def sim_school_major_arr
    [ ['哲学系','0101'],['经济学系','0201'],['财政学系','0202'],['金融学系','0203'],['经济与贸易','0204'],['法学系','0301'],['政治学系','0302'],['社会学系','0303'],['民族学系','0304'],['马克思主义理论系','0305'],['公安学系','0306'],['教育学系','0401'],['体育学系','0402'],['中国语言文学系','0501'],['外国语言文学系','0502'],['新闻传播学系','0503'],['历史学系','0601'],['数学系','0701'],['物理学系','0702'],['化学系','0703'],['天文学系','0704'],['地理科学系','0705'],['大气科学系','0706'],['海洋科学系','0707'],['地球物理学系','0708'],['地质学系','0709'],['生物科学系','0710'],['心理学系','0711'],['统计学系','0712'],['力学系','0801'],['机械系','0802'],['仪器系','0803'],['材料系','0804'],['能源动力系','0805'],['电气系','0806'],['电子信息学系','0807'],['自动化学系','0808'],['计算机学系','0809'],['土木工程学系','0810'],['水利工程学系','0811'],['测绘系','0812'],['化工与制药学系','0813'],['地质学系','0814'],['矿业学系','0815'],['纺织学系','0816'],['轻工学系','0817'],['交通运输学系','0818'],['海洋工程学系','0819'],['航空航天学系','0820'],['兵器学系','0821'],['核工程学系','0822'],['农业工程学系','0823'],['林业工程学系','0824'],['环境科学与工程学系','0825'],['生物医学工程学系','0826'],['食品科学与工程学系','0827'],['建筑学系','0828'],['安全科学与工程学系','0829'],['生物工程学系','0830'],['公安技术学系','0831'],['植物生产学系','0901'],['自然保护与环境生态','0902'],['动物生产学系','0903'],['动物医学系','0904'],['林业学系','0905'],['水产学系','0906'],['草学系','0907'],['基础医学系','1001'],['临床医学系','1002'],['口腔医学系','1003'],['中医学系','1005'],['公共卫生与预防医学','1004'],['中西医结合学系','1006'],['药学系','1007'],['中药学系','1008'],['法医学系','1009'],['医学技术学系','1010'],['护理学系','1011'],['管理科学与工程学系','1201'],['工商管理学系','1202'],['农业经济管理学系','1203'],['公共管理学系','1204'],['图书情报与档案管理','1205'],['物流管理与工程学系','1206'],['旅游管理学系','1209'],['工业工程学系','1207'],['电子商务学系','1208'],['艺术学理论学系','1301'],['音乐与舞蹈学系','1302'],['戏剧与影视学系','1303'],['美术学系','1304'],['设计学系','1305'] ]
  end

  def sim_educational_background_arr
    [ ['小學',1],['初中',2],['高中',3],['專科',4],['大學',5],['碩士',6],['博士',7] ]
  end
