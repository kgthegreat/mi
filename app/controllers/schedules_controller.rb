class SchedulesController < HomeController

  before_filter :authenticate_user!

  def new
    respond_with @schedule = Schedule.new 
  end

  def create
    @schedule = Schedule.new params[:schedule]
    @schedule.timeslot = Timeslot.find_by_date_and_start_time(params[:timeslot_date], params[:timeslot_time])
    if @schedule.save
      respond_with @schedule, :location => '/'
    else
      respond_with @schedule
    end
  end  
end
