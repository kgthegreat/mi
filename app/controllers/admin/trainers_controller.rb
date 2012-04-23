class Admin::TrainersController < ApplicationController
  respond_to :html
  
  def create
    @trainer = Trainer.new(params[:trainer])
    if @trainer.save
      respond_with @trainer, :location => admin_trainers_path
    end
  end  
end
