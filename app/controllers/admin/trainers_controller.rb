class Admin::TrainersController < Admin::AdminController

  before_filter :find_trainer, :only => [:edit, :destroy, :update]
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

  def edit
    respond_with @trainer
  end

  def update
    params[:trainer][:domain_ids] ||= []
    if @trainer.update_attributes params[:trainer]
      respond_with @trainer, :location => admin_trainers_path
    else
      respond_with @trainer
    end  
  end

  
  def destroy
    @trainer.destroy
    flash[:notice] = "Entry deleted"
    redirect_to admin_trainers_path
  end

  private
  def find_trainer
    @trainer = Trainer.find params[:id]
  end
end

