class Schedule < ActiveRecord::Base
  belongs_to :user
  belongs_to :domain
  # attr_accessible :title, :body
end
