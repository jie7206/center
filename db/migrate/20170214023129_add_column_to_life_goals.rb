class AddColumnToLifeGoals < ActiveRecord::Migration
  def self.up
    add_column :life_goals, :created_at, :datetime
    add_column :life_goals, :updated_at, :datetime
  end

  def self.down
    remove_column :life_goals, :updated_at
    remove_column :life_goals, :created_at
  end
end
