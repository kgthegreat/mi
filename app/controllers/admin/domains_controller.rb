class Admin::DomainsController < ApplicationController

  respond_to :html

  before_filter :find_domain, :only => [:edit,:update]
  
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

  private

  def find_domain
    @domain = Domain.find params[:id]
  end
end
