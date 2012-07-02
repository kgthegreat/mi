class Trainers::Schedules::FeedbacksController < ApplicationController
  layout 'trainer'
  before_filter :find_trainer
  before_filter :find_schedule
  before_filter :find_feedback, :only => [:show, :update, :edit]
  
  def new
    respond_with @feedback = Feedback.new
  end
  def create
    @feedback = @schedule.build_feedback params[:feedback]
    if @feedback.save
      respond_with @feedback, :location => trainer_schedules_path(@trainer)
    else
      respond_with @feedback
    end
  end

  def update
    if @feedback.update_attributes params[:feedback]
      respond_with @feedback, :location => trainer_schedule_feedback_path(@trainer, @schedule)
    else
      respond_with @feedback
    end
  end

  def show
    respond_with @feedback
  end
  def edit
    respond_with @feedback
  end
  private
  def find_schedule
    @schedule = Schedule.find params[:schedule_id]
  end
  def find_trainer
    @trainer = Trainer.find params[:trainer_id]
  end
  def find_feedback
    @feedback = @schedule.feedback
  end
end
