require 'spec_helper'

describe SchedulesController do

  describe "GET new" do
    before :each do
      get :new
    end
    it {should respond_with :success}
    it {should render_template :new}
    it {should assign_to :schedule}
  end

  describe "POST create" do
    before :each do
      @domain = create :domain 
    end

    it "should create the schedule" do
      lambda {post :create, :schedule => {:domain_id => @domain}}.should change(Schedule,:count).by 1
    end
    it "should not create the schedule if domain id not present" do
      lambda {post :create, :schedule => {}}.should change(Schedule,:count).by 0
    end

  end
end
