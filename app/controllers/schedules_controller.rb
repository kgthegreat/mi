class SchedulesController < HomeController

  def new
    respond_with @schedule = Schedule.new 
  end

  def create
    @schedule = Schedule.new params[:schedule]
    if @schedule.save
      respond_with @schedule, :location => schedules_path
    else
      respond_with @schedule
    end
  end  
end
