require 'spec_helper'

describe Users::SchedulesController do

  before :each do
    @user = create :user
    sign_in @user
  end
  
  describe "GET index" do
    before :each do
      get :index
    end
    it {should respond_with :success}
    it {should render_template :index}
    it {should assign_to :schedules}
  end


  
end
