class AddColumnToMemberReports < ActiveRecord::Migration
  def self.up
    add_column :member_reports, :m_supporter_student, :integer
    add_column :member_reports, :m_supporter_young, :integer
    add_column :member_reports, :m_supporter_adult, :integer
    add_column :member_reports, :m_supporter_old, :integer
    add_column :member_reports, :m_supporter_college, :integer
    add_column :member_reports, :m_supporter_student_ids, :text
    add_column :member_reports, :m_supporter_young_ids, :text
    add_column :member_reports, :m_supporter_adult_ids, :text
    add_column :member_reports, :m_supporter_old_ids, :text
    add_column :member_reports, :m_supporter_college_ids, :text
    add_column :member_reports, :f_supporter_student, :integer
    add_column :member_reports, :f_supporter_young, :integer
    add_column :member_reports, :f_supporter_adult, :integer
    add_column :member_reports, :f_supporter_old, :integer
    add_column :member_reports, :f_supporter_college, :integer
    add_column :member_reports, :f_supporter_student_ids, :text
    add_column :member_reports, :f_supporter_young_ids, :text
    add_column :member_reports, :f_supporter_adult_ids, :text
    add_column :member_reports, :f_supporter_old_ids, :text
    add_column :member_reports, :f_supporter_college_ids, :text
  end

  def self.down
  end
end
