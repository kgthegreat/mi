require 'spec_helper'

describe Trainers::SchedulesController do

  before :each do
    @trainer = create :trainer
    sign_in @trainer
  end
  
  describe "GET index" do
    before :each do
      get :index, :trainer_id => @trainer
    end
    it {should respond_with :success}
    it {should render_template :index}
    it {should assign_to :schedules}
  end


  
end
