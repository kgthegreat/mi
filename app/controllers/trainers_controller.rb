class TrainersController < ApplicationController

  def show
    respond_with(@trainer = Trainer.find(params[:id]))
  end

end
