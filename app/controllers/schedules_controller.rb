class SchedulesController < HomeController

  before_filter :authenticate_user!

  def new
    respond_with @schedule = Schedule.new 
  end

  def create
    @schedule = Schedule.new params[:schedule].merge(:user_id => current_user.id)
    if params[:timeslot_time] && params[:timeslot_date]
      @schedule.timeslot = Timeslot.find_by_date_and_start_time(params[:timeslot_date], params[:timeslot_time].chomp(" UTC"))
    end
    if @schedule.save
      respond_with @schedule, :location => root_url
    else
      respond_with @schedule
    end
  end  
end
