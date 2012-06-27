require 'spec_helper'

describe Admin::SchedulesController do

  before :each do
    @admin = create :admin
    sign_in @admin
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
