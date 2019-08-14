class AddColumnToActivities < ActiveRecord::Migration
  def self.up
    add_column :activities, :cleaner, :string
  end

  def self.down
    remove_column :activities, :cleaner
  end
end
