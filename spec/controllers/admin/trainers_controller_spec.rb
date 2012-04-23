require 'spec_helper'

describe Admin::TrainersController do
  render_views

  describe "GET index" do
    it "should render index template"
    it "should show a list of trainers"
  end

  describe "GET new" do
    it "should render new template"
  end

  describe "POST create" do
    it "should create a new trainer" do
      lambda { post :create, :trainer => {:email => "some@some.com",:password => "asd123"}
      }.should change(Trainer, :count).by(1)
      
      
    end
  end
end
