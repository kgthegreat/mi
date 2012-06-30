class Timeslot < ActiveRecord::Base
  belongs_to :trainer
  belongs_to :schedule
  attr_accessible :date, :end_time, :start_time, :interview_type, :approved
  validates :date, :presence => true
  validates :start_time, :presence => true
  scope :available, where(:schedule_id => nil)
  scope :approved, where(:approved => true)
  scope :chrono, :order => "date asc"
end
