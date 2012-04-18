require 'spec_helper'

describe Admin::DomainsController do

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
end
