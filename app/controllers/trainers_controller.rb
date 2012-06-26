class TrainersController < ApplicationController
  layout 'trainer'
  before_filter :find_trainer
  before_filter :authorised_trainer?
  def show
    respond_with @trainer
  end

  private
  def find_trainer
    @trainer = Trainer.find params[:id]
  end
  def authorised_trainer?
    unless @trainer.id == current_trainer.id
      redirect_to prohibited_path
    end  
  end
end
