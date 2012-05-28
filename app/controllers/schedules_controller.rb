class SchedulesController < HomeController

  def new
    respond_with @schedule = Schedule.new 
  end
end
