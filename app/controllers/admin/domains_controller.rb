class Admin::DomainsController < Admin::AdminController

  before_filter :find_domain, :only => [:edit,:update, :destroy]
  
  def new
    @domain = Domain.new
  end

  def create
    @domain = Domain.new params[:domain]
    if @domain.save
      respond_with @domain, :location => admin_domains_path
    else
      render :new

    end
  end

  def index
    respond_with @domains = Domain.all
  end

  def edit
    respond_with @domain
  end

  def update
    if @domain.update_attributes(params[:domain])
      respond_with @domain, :location => admin_domains_path
    else
      render :edit
    end  
  end

  def destroy
    @domain.destroy
    flash[:notice] = "Entry deleted"
    redirect_to admin_domains_path
  end

  private

  def find_domain
    @domain = Domain.find params[:id]
  end
end
