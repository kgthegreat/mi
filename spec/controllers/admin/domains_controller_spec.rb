require 'spec_helper'

describe Admin::DomainsController do

  render_views

  before :each do
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
    before :each do
      post :update, :id => @domain, :domain => {:name=> "someother"}      
    end

    it "should update the domain in question" do
      
      @domain.reload.name.should eq "someother"
    end
    it "should render edit template if update fails" do
      post :update, :id => @domain, :domain => {:name=> ""}
      response.should render_template :edit
    end
  end
end
