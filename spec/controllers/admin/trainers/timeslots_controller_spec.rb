require 'spec_helper'

describe Admin::Trainers::TimeslotsController do

  render_views

  before :each do
    sign_in create :admin
    @trainer = create :trainer
  end

  describe "GET new" do
    it "should render the new template" do
      get :new, :trainer_id => @trainer
      response.should be_ok
      response.should render_template :new
    end
  end

  describe "POST create" do
    it "should create the timeslot" do
      lambda {post :create, :trainer_id => @trainer, :timeslot => {:date => '19-5-2012', :start_time => Time.now}}.should change {@trainer.timeslots.count}.by(1)
    end

    it "should not create the timeslot without the date" do
      lambda {post :create, :trainer_id => @trainer, :timeslot => {:start_time => Time.now}}.should change {@trainer.timeslots.count}.by(0)
    end

  end

  
end
