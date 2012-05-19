class Domain < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, :presence => true, :uniqueness => true

  has_and_belongs_to_many :trainers
end
