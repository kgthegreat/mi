class UsersController < ApplicationController
  layout :resolve_layout
  before_filter :find_user
  before_filter :authorised_user?
  def show
    respond_with @user
  end
  def edit
    respond_with @user
  end
  def update
    if @user.update_attributes params[:user]
      respond_with @user, :location => root_url
    end
  end
  private
  def find_user
    @user = User.find params[:id]
  end
  def authorised_user?
    unless @user.id == current_user.id
      redirect_to prohibited_path
    end  
  end
  def resolve_layout
    if params[:schedule]
      'public'
    else
      'user'
    end
  end
end
