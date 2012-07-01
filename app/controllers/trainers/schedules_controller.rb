class Trainers::SchedulesController < ApplicationController
  layout 'trainer'
  def index
    @schedules = []
    current_trainer.timeslots.each do |timeslot|
      @schedules << Schedule.find(timeslot.schedule_id) if timeslot.schedule_id
    end
    respond_with @schedules 
  end
end
