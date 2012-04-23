class Admin::TrainersController < ApplicationController
  respond_to :html

  before_filter :authenticate_admin!
  def create
    @trainer = Trainer.new(params[:trainer])
    if @trainer.save
      respond_with @trainer, :location => admin_trainers_path
    else
      render :new
    end
    
  end

  def index
    respond_with @trainers = Trainer.all
  end

  def new
    respond_with @trainer = Trainer.new
  end

  def destroy
    @domain = Trainer.find params[:id]
    @domain.destroy
    flash[:notice] = "Entry deleted"
    redirect_to admin_trainers_path
  end
  
end

