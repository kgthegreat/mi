class Schedule < ActiveRecord::Base
  belongs_to :user
  belongs_to :domain
  attr_accessible :domain_id
  validates :domain_id, :presence => true
end
