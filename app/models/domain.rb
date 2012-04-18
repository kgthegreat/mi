class Domain < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, :presence => true, :uniqueness => true
end
