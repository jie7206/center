class ChangeColumnToAssetItems < ActiveRecord::Migration
  def self.up
    change_column :asset_items, :loan_begin_date, :string
  end

  def self.down
  end
end
