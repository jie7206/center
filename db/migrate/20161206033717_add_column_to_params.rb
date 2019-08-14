class AddColumnToParams < ActiveRecord::Migration
  def self.up
    add_column :params, :created_at, :datetime
    add_column :params, :updated_at, :datetime
  end

  def self.down
    remove_column :params, :updated_at
    remove_column :params, :created_at
  end
end
