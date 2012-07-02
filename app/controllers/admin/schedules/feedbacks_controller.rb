class Admin::Schedules::FeedbacksController < Admin::AdminController
  before_filter :find_schedule
  def show
    respond_with(@feedback = @schedule.feedback)
  end
  private
  def find_schedule
    @schedule = Schedule.find params[:schedule_id]
  end
end
