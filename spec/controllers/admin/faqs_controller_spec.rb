require 'spec_helper'

describe Admin::FaqsController do
  render_views

  before :each do
    @admin_user = Admin.create!({:email=>"admin@admin.com", :password => "asd123"})
    sign_in @admin_user
    @faq_params = {:question => "Some Question", :answer => "Some Ans"}
    @faq = Faq.create!(@faq_params)
  end
  describe "GET new" do
    it "should render the new template" do
      get :new
      response.should render_template :new
    end

    it "should assign a new faq object" do
      get :new
      assigns[:faq].should be_new_record
    end
    
    context "failure" do
      context "for normal user" do
        before :each do
          sign_out @admin_user
          @user = User.create!(:email => "hello@hello.com", :password => "password")
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
          @trainer = Trainer.create!(:email => "hello@hello.com", :password => "password")
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

  describe "POST create" do
    it "should create a new faq" do
      lambda {
        post :create, :faq => @faq_params
      }.should change(Faq, :count).by(1)
      
    end

    it "should not create a new faq if the question is missing" do
      post :create, :faq => {:question => "", :answer => "some ans"}
      response.should render_template :new
    end

    it "should not create a new faq if the answer is missing" do
      post :create, :faq => {:question => "SOme q", :answer => ""}
      response.should render_template :new
    end

  end

  describe "GET index" do
    it "should list all the faqs" do
      get :index
      assigns[:faqs].should eq Faq.all
    end

    it "should render index template" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET edit" do
    before :each do

      get :edit, :id => @faq
    end
    it "should render edit template" do
      response.should render_template :edit
    end
    it "should assign @faq with the faq to be edited" do
      assigns[:faq].should eq @faq
    end
  end

  describe "PUT update" do

    it "should update the faq in question" do
      post :update, :id => @faq, :faq => {:question=> "someother", :answer => "Someanswer"}      
      @faq.reload.question.should eq "someother"
    end
    it "should render edit template if update fails" do
      post :update, :id => @faq, :faq => {:question=> "someother", :answer => ""}
      response.should render_template :edit
    end
  end

  describe "DELETE destroy" do
    it "should delete the faq" do
      lambda {
        delete :destroy, :id => @faq
      }.should change(Faq, :count).by(-1)
      
    end

    it "should inform the user of the deletion" do
      delete :destroy, :id => @faq
      flash[:notice].should include "Entry deleted"
    end

    it "should redirect to list of faqs" do
      delete :destroy, :id => @faq
      response.should redirect_to admin_faqs_path
    end
  end

end
