require 'spec_helper'

describe UsersController do

  before :each do
    @user = create :user
    sign_in @user
  end
  describe "GET show" do
    before :each do
      get :show, :id => @user
    end
    it {should respond_with :success}
    it {should render_template :show}
    it {should assign_to :user}

    it "should show the prohibited page when the looged in user tries to access any other page" do
      user2 = create :user, :email=>"someelse@some.com"
      get :show, :id => user2
      response.should redirect_to prohibited_path
    end
  end
  
end

