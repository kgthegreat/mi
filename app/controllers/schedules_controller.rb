class SchedulesController < HomeController

  before_filter :authenticate_user!

  def new
    respond_with @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new params[:schedule].merge(:user_id => current_user.id)
#    if params[:timeslot_time] && params[:timeslot_date]
 #     @schedule.timeslot = Timeslot.find_by_date_and_start_time(params[:timeslot_date], params[:timeslot_time].chomp(" UTC"))
    #  end
    @schedule.timeslot = Timeslot.find(params[:timeslot]) if params[:timeslot]
    if @schedule.save
      respond_with @schedule, :location => edit_user_path(current_user, :schedule => true)
    else
      respond_with @schedule
    end
  end

  def timeslot_to_display
    @to_go = Hash.new
    domain = Domain.find(params[:id])
    domain.trainers.each do |trainer|
      trainer.timeslots.approved.available.each do |timeslot|
        if !(@to_go.keys.include? timeslot.date)
          @to_go[timeslot.date] = [timeslot]         
        else
          @to_go[timeslot.date] << timeslot
        end  
      end
    end
      
    render :json => Hash[@to_go.sort]
  end
end
