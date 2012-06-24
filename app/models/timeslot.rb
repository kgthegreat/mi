class Timeslot < ActiveRecord::Base
  belongs_to :trainer
  belongs_to :schedule
  attr_accessible :date, :end_time, :start_time, :interview_type
  validates :date, :presence => true
  validates :start_time, :presence => true
  scope :available, where(:schedule_id => nil) 
end
