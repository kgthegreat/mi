class Trainers::TimeslotsController < ApplicationController
  layout 'trainer'
  before_filter :find_trainer
  before_filter :find_timeslot, :only => [:edit, :update, :destroy]
  before_filter :authorised_trainer?
  def index
    respond_with (@timeslots = @trainer.timeslots)
  end

  def new
    @timeslot = @trainer.timeslots.new
  end

  def create
    @timeslot = @trainer.timeslots.new params[:timeslot]
    if @timeslot.save
      respond_with @timeslot, :location => trainer_timeslots_path(@trainer)
    else
      respond_with @timeslot
    end
  end

  def edit
    respond_with @timeslot
  end

  def update
    if @timeslot.update_attributes(params[:timeslot])
      respond_with @timeslot, :location => trainer_timeslots_path(@trainer)
    else
      respond_with @timeslot
    end
  end

  def destroy
    @timeslot.destroy
    redirect_to admin_trainer_timeslots_path(@trainer)
  end

  private
  def find_trainer
    @trainer = Trainer.find params[:trainer_id]
  end
  def authorised_trainer?
    if @trainer.id != current_trainer.id
      redirect_to prohibited_path
    end  
  end
  def find_timeslot
    @timeslot = @trainer.timeslots.find params[:id]
  end

end
