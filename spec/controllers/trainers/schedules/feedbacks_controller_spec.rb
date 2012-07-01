require 'spec_helper'

describe Trainers::Schedules::FeedbacksController do
  before :each do
    @trainer = create :trainer
    sign_in @trainer
    @schedule = create :schedule
    @feedback = Feedback.create!(:schedule_id => @schedule)
  end
  describe "GET new" do
    before :each do
      get :new, :trainer_id => @trainer, :schedule_id => @schedule
    end

    it {should respond_with :success}
    it {should render_template :new}
    it {should assign_to :feedback}
    
  end

  describe "GET show" do
    before :each do
      get :show, :trainer_id => @trainer, :schedule_id => @schedule
    end

    it {should respond_with :success}
    it {should render_template :show}
    it {should assign_to :feedback}
        
  end

  describe "GET edit" do
    before :each do
      get :edit, :trainer_id => @trainer, :schedule_id => @schedule
    end

    it {should respond_with :success}
    it {should render_template :edit}
    it {should assign_to :feedback}
        
  end

  describe "POST create" do
    it "should create a feedback object" do
      lambda{
        post :create, :trainer_id => @trainer, :schedule_id => @schedule, :feedback => {:title => "some", :description => "some"}
      }.should change(Feedback, :count).by 1
    end
    it "should redirect to trainer's schedules page" do
      post :create, :trainer_id => @trainer, :schedule_id => @schedule, :feedback => {:title => "some", :description => "some"}
      response.should redirect_to trainer_schedules_path(@trainer)
    end
  end

  describe "PUT update" do
    it "should update a feedback object" do
      put :update, :trainer_id => @trainer, :schedule_id => @schedule, :feedback => {:title => "sometitle", :description => "some"}
    end
    it "should redirect to schedule's feedback page" do
      put :update, :trainer_id => @trainer, :schedule_id => @schedule, :feedback => {:title => "sometitle", :description => "some"}
      response.should redirect_to trainer_schedule_feedback_path(@trainer, @schedule)
    end
  end

end
