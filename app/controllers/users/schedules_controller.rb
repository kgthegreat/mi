class Users::SchedulesController < ApplicationController
  layout 'user'
  def index
    respond_with @schedules = Schedule.where(:user_id => current_user.id)
  end
end
