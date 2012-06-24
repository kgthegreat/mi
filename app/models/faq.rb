class Faq < ActiveRecord::Base
  attr_accessible :answer, :question

  validates :question, :presence => true
  validates :answer, :presence => true
end
