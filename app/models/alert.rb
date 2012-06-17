class Alert < ActiveRecord::Base
  validates :title, :presence => true

  attr_accessible :date, :description, :title, :venue
end
