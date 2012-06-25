class Trainers::TimeslotsController < TrainersController

  before_filter :find_trainer
  def index
    respond_with (@timeslots = @trainer.timeslots)
  end

  private
  def find_trainer
    @trainer = Trainer.find params[:trainer_id]
  end

end
