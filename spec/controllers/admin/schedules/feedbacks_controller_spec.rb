require 'spec_helper'

describe Admin::Schedules::FeedbacksController do
  before :each do
    @admin = create :admin
    sign_in @admin
    @feedback = create :feedback
    @schedule = @feedback.schedule
  end

  describe "GET show" do
    before :each do
      get :show, :schedule_id => @schedule      
    end
    
    it {should respond_with :success}
    it {should render_template :show}
    it {should assign_to(:feedback).with @schedule.feedback }
  end

end
