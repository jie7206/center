class AddGeneration23CountToMemberReports < ActiveRecord::Migration
  def self.up
    add_column :member_reports, :generation2_3_count, :integer
  end

  def self.down
    remove_column :member_reports, :generation2_3_count
  end
end
