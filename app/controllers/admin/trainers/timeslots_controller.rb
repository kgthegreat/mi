class Admin::Trainers::TimeslotsController < Admin::AdminController

  before_filter :find_trainer
  before_filter :find_timeslot , :only => [:edit,:update, :destroy]
  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = @trainer.timeslots.new params[:timeslot]
    if @timeslot.save
      respond_with @timeslot, :location => admin_trainers_path
    else
      respond_with @timeslot
    end
  end

  def index
    respond_with(@timeslots = @trainer.timeslots)
  end

  def edit
    respond_with @timeslot
  end

  def update
    if @timeslot.update_attributes(params[:timeslot])
      respond_with @timeslot, :location => admin_trainers_path
    else
      respond_with @timeslot
    end
  end

  def destroy
    @timeslot.destroy
    redirect_to admin_trainers_path
  end

  private
  def find_trainer
    @trainer = Trainer.find params[:trainer_id]
  end
  def find_timeslot
    @timeslot = @trainer.timeslots.find params[:id]
  end
end
