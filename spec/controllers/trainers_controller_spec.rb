require 'spec_helper'

describe TrainersController do

  before :each do
    @trainer = create :trainer
    sign_in @trainer
  end
  describe "GET show" do
    before :each do
      get :show, :id => @trainer
    end
    it {should respond_with :success}
    it {should render_template :show}
    it {should assign_to :trainer}

    it "should show the prohibited page when the looged in trainer tries to access any other page" do
      trainer2 = create :trainer, :email=>"someelse@some.com"
      get :show, :id => trainer2
      response.should redirect_to prohibited_path
    end
  end
  
end
