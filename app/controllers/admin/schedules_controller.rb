class Admin::SchedulesController < Admin::AdminController
  def index
    respond_with @schedules = Schedule.all
  end
end
