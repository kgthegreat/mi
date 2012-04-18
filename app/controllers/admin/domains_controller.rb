class Admin::DomainsController < ApplicationController
  def new
    @domain = Domain.new
  end
end
