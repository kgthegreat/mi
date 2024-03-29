require 'spec_helper'

describe Admin::TrainersController do
  render_views


  before :each do
    @admin_user = create :admin
    sign_in @admin_user
    @trainer = create :trainer
  end

  describe "GET index" do

    before :each do
      get :index
    end
    it "should render index template" do
      response.should render_template :index
    end
    it "should show a list of trainers" do
      assigns[:trainers].should eq Trainer.all
    end
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
      end
      context "for trainers" do
        before :each do
          sign_out @admin_user
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

  describe "GET new" do
    before :each do
      get :new
    end
    it "should render new template" do
      response.should render_template :new
    end
  end

  describe "POST create" do
    it "should create a new trainer" do
      lambda { post :create, :trainer => {:email => "some@some.com",:password => "asd123"}
      }.should change(Trainer, :count).by(1)
    end

    it "should not create a trainer without an email" do
      lambda { post :create, :trainer => {:email => "",:password => "asd123"}
      }.should change(Trainer, :count).by(0)

    end

    it "should not create a trainer without a password" do
      lambda { post :create, :trainer => {:email => "some@some",:password => ""}
      }.should change(Trainer, :count).by(0)

    end

    it "should not create a trainer without a valid format of emails" do
      lambda { post :create, :trainer => {:email => "some",:password => "asd123"}
      }.should change(Trainer, :count).by(0)

    end

    it "should render new template in case create is not successful" do
      post :create, :trainer => {:email => "some",:password => "asd123"}
      response.should render_template :new
    end
    
  end


  describe "DELETE destroy" do
    it "should remove the trainer" do
      lambda {
        delete :destroy, :id => @trainer
      }.should change(Trainer, :count).by(-1)
      
    end

    it "should inform the user of the deletion" do
      delete :destroy, :id => @trainer
      flash[:notice].should include "Entry deleted"
    end

    it "should redirect to list of domains" do
      delete :destroy, :id => @trainer
      response.should redirect_to admin_trainers_path
    end
  end

  describe "GET edit" do
    before :each do
      get :edit, :id => @trainer
    end
    it { should respond_with :success}
    it { should render_template :edit}
    it { should assign_to :trainer }
  end

  describe "PUT update" do
    it "should update the trainer with the information provided" do
      domain_java = create :domain, :name => "java"
      domain_c =  create :domain, :name => "c"
      put :update, :id => @trainer, :trainer => {:domain_ids => [domain_java.id,domain_c.id]}
      @trainer.reload.domain_ids.should eq [domain_java.id,domain_c.id]
    end

    it "should update the domains of trainer with empty array if domain_ids not passed" do
      domain_java = create :domain, :name => "java"
      domain_c =  create :domain, :name => "c"
      @trainer.domain_ids = [domain_java.id,domain_c.id]
      put :update, :id => @trainer, :trainer => {}
      @trainer.reload.domain_ids.should eq []
    end

  end

end
