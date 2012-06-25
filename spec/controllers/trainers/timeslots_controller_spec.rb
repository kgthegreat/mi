require 'spec_helper'

describe Trainers::TimeslotsController do

  before :each do
    @trainer = create :trainer
  end
  describe "GET index" do
    before :each do
      get :index, :trainer_id => @trainer
    end
    it {should respond_with :success}
    it {should render_template :index}
    it {should assign_to :timeslots}
  end
  

end
