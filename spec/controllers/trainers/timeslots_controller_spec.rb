require 'spec_helper'

describe Trainers::TimeslotsController do

  before :each do
    @timeslot = create :timeslot
    @trainer = @timeslot.trainer
    sign_in @trainer
  end
  
  describe "GET index" do
    before :each do
      get :index, :trainer_id => @trainer
    end
    it {should respond_with :success}
    it {should render_template :index}
    it {should assign_to :timeslots}
  end
  
  describe "GET new" do
    before :each do
      get :new, :trainer_id => @trainer
    end

    it {should respond_with :success}
    it {should render_template :new}
    it {should assign_to :timeslot}
    
  end

  describe "GET edit" do
    before :each do
      get :edit, :trainer_id => @trainer, :id => @timeslot
    end

    it {should respond_with :success}
    it {should render_template :edit}
    it {should assign_to :timeslot}
    
  end


  describe "POST create" do
    it "should create the timeslot" do
      lambda {post :create, :trainer_id => @trainer, :timeslot => {:date => '19-5-2012', :start_time => Time.now}}.should change {@trainer.timeslots.count}.by(1)
    end

    it "should not create the timeslot without the date" do
      lambda {post :create, :trainer_id => @trainer, :timeslot => {:start_time => Time.now}}.should change {@trainer.timeslots.count}.by(0)
    end
  end

    describe 'PUT update' do
    it "should update the object with the information submitted" do
      date_before_update = @timeslot.date
      put :update, :trainer_id => @trainer, :id => @timeslot, :timeslot => {:date => '20-5-2012'}
      @timeslot.reload.date.should_not eq date_before_update
    end
    it "should not update the object if date is empty" do
      date_before_update = @timeslot.date
      put :update, :trainer_id => @trainer, :id => @timeslot, :timeslot => {:date => ''}
      @timeslot.reload.date.should eq date_before_update
    end

  end

  describe 'DELETE destroy' do
    it "should delete the object" do
      lambda {delete :destroy, :trainer_id => @trainer, :id => @timeslot}.should change {@trainer.timeslots.count}.by(-1)
      
      
    end
  end


end
