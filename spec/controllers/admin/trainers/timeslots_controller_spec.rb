require 'spec_helper'

describe Admin::Trainers::TimeslotsController do

  render_views

  before :each do
    sign_in create :admin
    @timeslot = create :timeslot
    @trainer = @timeslot.trainer
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

    it "should redirect to trainers list" do
      post :create, :trainer_id => @trainer, :timeslot => {:date => '19-5-2012', :start_time => Time.now}
      response.should redirect_to admin_trainers_path
    end
  end

  describe 'GET index' do
    before :each do
      get :index, :trainer_id => @trainer 
    end
    it "should render index template" do
      response.should be_ok
      response.should render_template :index
    end
    it 'should show all the timeslots' do
      assigns[:timeslots].should eq @trainer.timeslots
    end
  end

  describe 'GET edit' do
    before :each do
      get :edit , :trainer_id => @trainer, :id => @timeslot      
    end

    it "should render edit template" do
      response.should be_ok
      response.should render_template :edit
    end
    it "should assign @timeslot with the timeslot being edited" do
      assigns[:timeslot].should eq @timeslot
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
    it "should be able to update only approval status" do
      @timeslot.approved.should be_false
      date_before_update = @timeslot.date
      put :update, :trainer_id => @trainer, :id => @timeslot, :timeslot => {:approved => true}
      @timeslot.reload.date.should eq date_before_update
      @timeslot.reload.approved.should be_true
    end
    it "should redirect to trainers list" do
      put :create, :trainer_id => @trainer, :id => @timeslot, :timeslot => {:date => '20-5-2012', :start_time => Time.now}
      response.should redirect_to admin_trainers_path
    end
    
  end

  describe 'DELETE destroy' do
    it "should delete the object" do
      lambda {delete :destroy, :trainer_id => @trainer, :id => @timeslot}.should change {@trainer.timeslots.count}.by(-1)
    end
    it "should redirect to trainers list" do
      delete :destroy, :trainer_id => @trainer, :id => @timeslot
      response.should redirect_to admin_trainers_path
    end

  end
  
end
