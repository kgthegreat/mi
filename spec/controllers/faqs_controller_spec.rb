require 'spec_helper'

describe FaqsController do

  describe "GET index" do
    before :each do
      get :index
    end
    it {should respond_with :success}
    it {should render_template :index}
    it {should assign_to :faqs}
  end

end
