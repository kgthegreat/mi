require 'spec_helper'

describe Admin::DomainsController do

  render_views

  before :each do
    @admin_user = Admin.create!({:email=>"admin@admin.com", :password => "asd123"})
    sign_in @admin_user
    @domain = Domain.create!({:name=>"somename"})
  end
  describe "GET new" do
    it "should render the new template" do
      get :new
      response.should render_template :new
    end

    it "should assign a new domain object" do
      get :new
      assigns[:domain].should be_new_record
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
      end
    end

  end

  describe "POST create" do
    it "should create a new domain" do
      lambda {
        post :create, :domain => {:name => "Some domain"}
      }.should change(Domain, :count).by(1)
      
    end

    it "should not create a new domain if the name is missing" do
      post :create, :domain => {:name => ""}
      response.should render_template :new
    end
  end

  describe "GET index" do
    it "should list all the domains" do
      get :index
      assigns[:domains].should eq Domain.all
    end

    it "should render index template" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET edit" do
    before :each do

      get :edit, :id => @domain
    end
    it "should render edit template" do
      response.should render_template :edit
    end
    it "should assign @domain with the domain to be edited" do
      assigns[:domain].should eq @domain
    end
  end

  describe "PUT update" do

    it "should update the domain in question" do
      post :update, :id => @domain, :domain => {:name=> "someother"}      
      @domain.reload.name.should eq "someother"
    end
    it "should render edit template if update fails" do
      post :update, :id => @domain, :domain => {:name=> ""}
      response.should render_template :edit
    end
  end

  describe "DELETE destroy" do
    it "should delete the domain" do
      lambda {
        delete :destroy, :id => @domain
      }.should change(Domain, :count).by(-1)
      
    end

    it "should inform the user of the deletion" do
      delete :destroy, :id => @domain
      flash[:notice].should include "Entry deleted"
    end

    it "should redirect to list of domains" do
      delete :destroy, :id => @domain
      response.should redirect_to admin_domains_path
    end
  end
end
