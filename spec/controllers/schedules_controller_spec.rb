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
    
  end
end
