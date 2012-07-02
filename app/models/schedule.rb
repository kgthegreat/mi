class Schedule < ActiveRecord::Base
  belongs_to :user
  belongs_to :domain
  has_one :timeslot
  has_one :feedback
  attr_accessible :domain_id, :timeslot, :user_id
  validates :domain_id, :presence => true
  validates :user_id, :presence => true
end
