class Trainers::SchedulesController < ApplicationController
  layout 'trainer'
  before_filter :find_trainer
  def index
    @schedules = []
    current_trainer.timeslots.each do |timeslot|
      @schedules << Schedule.find(timeslot.schedule_id) if timeslot.schedule_id
    end
    respond_with @schedules 
  end

  private
  def find_trainer
    @trainer = Trainer.find params[:trainer_id]
  end
end
