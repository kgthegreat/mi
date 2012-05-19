class Admin::Trainers::TimeslotsController < Admin::TrainersController

  before_filter :find_trainer
  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = @trainer.timeslots.new params[:timeslot]
    if @timeslot.save
      respond_with @timeslot, :location => admin_trainer_timeslots_path(@trainer)
    else
      respond_with @timeslot
    end
    
  end

  private
  def find_trainer
    @trainer = Trainer.find params[:trainer_id]
  end
end
