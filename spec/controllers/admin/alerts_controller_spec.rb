require 'spec_helper'

describe Admin::AlertsController do
  render_views

  before :each do
    @admin_user = create :admin
    sign_in @admin_user
    @alert_params = {:title => "Some title", :description => "Some description"}
    @alert = create :alert
  end

  describe "GET new" do
    before :each do
      get :new
    end
    it {should respond_with :success}
    it {should render_template :new}
    it {should assign_to :alert}
  end

  describe "POST create" do
    it "should create a new alert" do
      lambda {
        post :create, :alert => @alert_params
      }.should change(Alert, :count).by(1)
      
    end

    it "should not create a new alert if the title is missing" do
      post :create, :alert => {:title => "", :description => "some description"}
      response.should render_template :new
    end


  end

  describe "GET index" do
    before :each do
      get :index
    end
    it {should respond_with :success}
    it {should render_template :index}
    it {should assign_to :alerts}

    context "failure" do
      context "for normal user" do
        before :each do
          sign_out @admin_user
          @user = create :user
          sign_in @user
          get :index
        end

        it "should not be accessible to non admin user" do
          response.should_not render_template :index
        end
        it "should be a redirect" do
          response.should be_redirect
        end
        it "should redirect to admin sign in page" do
          response.should redirect_to new_admin_session_path
        end


      end
      context "for trainers" do
        before :each do
          sign_out @admin_user
          @trainer = create :trainer
          sign_in @trainer
          get :index
        end
        it "should not be accessible to non admin user" do
          response.should_not render_template :index
        end
        it "should be a redirect" do
          response.should be_redirect
        end
        it "should redirect to admin sign in page" do
          response.should redirect_to new_admin_session_path
        end
      end
    end

  end

  describe "GET edit" do
    before :each do
      get :edit, :id => @alert
    end
    it "should render edit template" do
      response.should render_template :edit
    end
    it "should assign @alert with the alert to be edited" do
      assigns[:alert].should eq @alert
    end
  end

  describe "PUT update" do

    it "should update the alert in title" do
      post :update, :id => @alert, :alert => {:title=> "someother", :description => "Somedescription"}      
      @alert.reload.title.should eq "someother"
    end
    it "should render edit template if update fails" do
      post :update, :id => @alert, :alert => {:title=> "", :description => "some"}
      response.should render_template :edit
    end
  end

  describe "DELETE destroy" do
    it "should delete the alert" do
      lambda {
        delete :destroy, :id => @alert
      }.should change(Alert, :count).by(-1)
      
    end

    it "should inform the user of the deletion" do
      delete :destroy, :id => @alert
      flash[:notice].should include "Entry deleted"
    end

    it "should redirect to list of alerts" do
      delete :destroy, :id => @alert
      response.should redirect_to admin_alerts_path
    end
  end

end
