class AddColumnToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :is_manager, :boolean
    add_column :members, :is_cleaner, :boolean
  end

  def self.down
    remove_column :members, :is_cleaner
    remove_column :members, :is_manager
  end
end
