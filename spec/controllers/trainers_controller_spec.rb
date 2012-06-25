require 'spec_helper'

describe TrainersController do

  before :each do
    @trainer = create :trainer
  end
  describe "GET show" do
    before :each do
      get :show, :id => @trainer
    end
    it {should respond_with :success}
    it {should render_template :show}
    it {should assign_to :trainer}
  end
end
