class UsersController < ApplicationController
  layout 'user'
  before_filter :find_user
  before_filter :authorised_user?
  def show
    respond_with @user
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
end
