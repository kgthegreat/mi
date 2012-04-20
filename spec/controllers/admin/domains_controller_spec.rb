require 'spec_helper'

describe Admin::DomainsController do

  render_views


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
      redirect_to new_admin_domain_path
    end

  end
end
