class Admin::DomainsController < ApplicationController

  respond_to :html
  
  def new
    @domain = Domain.new
  end

  def create
    @domain = Domain.new params[:domain]
    if @domain.save
      respond_with @domain, :location => admin_domains_path
    else
      respond_with @domain
    end
  end
end
