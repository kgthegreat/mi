class Admin::AlertsController < Admin::AdminController

  before_filter :find_alert, :only => [:edit,:update, :destroy]
  
  def new
    @alert = Alert.new
  end

  def create
    @alert = Alert.new params[:alert]
    if @alert.save
      respond_with @alert, :location => admin_alerts_path
    else
      render :new

    end
  end

  def index
    respond_with @alerts = Alert.all
  end

  def edit
    respond_with @alert
  end

  def update
    if @alert.update_attributes(params[:alert])
      respond_with @alert, :location => admin_alerts_path
    else
      render :edit
    end  
  end

  def destroy
    @alert.destroy
    flash[:notice] = "Entry deleted"
    redirect_to admin_alerts_path
  end

  private

  def find_alert
    @alert = Alert.find params[:id]
  end
end
