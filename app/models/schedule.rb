class Schedule < ActiveRecord::Base
  belongs_to :user
  belongs_to :domain
  has_one :timeslot
  attr_accessible :domain_id, :timeslot
  validates :domain_id, :presence => true
end
