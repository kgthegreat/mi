class Feedback < ActiveRecord::Base
  belongs_to :schedule
  attr_accessible :description, :title, :schedule_id
end
