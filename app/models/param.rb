class Param < ActiveRecord::Base

	has_many :param_changes
	has_many :life_goals
	validates_uniqueness_of :name, :on => :create, :message => "參數名稱不可以重複!"
	before_destroy :cant_destroy_id_in_using
	before_save :check_order_num
	after_save :update_btc_assets

	#更新与比特币相关的资产现值
	def update_btc_assets
		if self.name == "btc_price"
			btc_arr = Param.find_by_name("my_btc").value.split(",")
			btc_price = self.value.to_f
			trezor_amount = btc_arr[0].to_f #冷钱包
			jie7206_amount = btc_arr[1].to_f #冷钱包:jie7206
			huobi_135_amount = btc_arr[2].to_f #火币135
			huobi_170_amount = btc_arr[3].to_f #火币170
			bitoex_amount = btc_arr[4].to_f #台湾币托
			#wotoken_17099311026_amount = btc_arr[4].to_f
			#wotoken_15201669421_amount = btc_arr[5].to_f
			#更新冷钱包
			AssetItem.find(135).update_attribute(:amount,format("%.4f",btc_price*trezor_amount))
			#更新冷钱包:jie7206
			AssetItem.find(28).update_attribute(:amount,format("%.4f",btc_price*jie7206_amount))
			#更新台湾币托
			AssetItem.find(117).update_attribute(:amount,format("%.4f",btc_price*bitoex_amount))
			#更新火币170
			AssetItem.find(11).update_attribute(:amount,format("%.4f",btc_price*huobi_170_amount))
			#更新火币135
			AssetItem.find(134).update_attribute(:amount,format("%.4f",btc_price*huobi_135_amount))
			#更新WoTokenApollo资产：17099311026
			#AssetItem.find(119).update_attribute(:amount,format("%.4f",btc_price*wotoken_17099311026_amount))
			#更新WoTokenApollo资产：15201669421
			#AssetItem.find(120).update_attribute(:amount,format("%.4f",btc_price*wotoken_15201669421_amount))
		end
	end

	def check_order_num
		self.order_num = Param.last.order_num + 1 if not self.order_num
	end

	def cant_destroy_id_in_using
		if rec_change
			raise "无法删除帶有記錄變化的參數!"
		end
	end

	def get_life_interests_str
		result = ''
		if self.content.include?(',') or self.content.to_i > 0
			self.content.split(',').each do |num|
				p = Param.find_by_name('life_interest_'+num)
				result += trip_title(p.title) + p.value + '分，'
			end
		end
		return result[0..-2]
	end

end
