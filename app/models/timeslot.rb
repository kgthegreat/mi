class Timeslot < ActiveRecord::Base
  belongs_to :trainer
  attr_accessible :date, :end_time, :start_time, :type
  validates :date, :presence => true
  validates :start_time, :presence => true
end
