require 'spec_helper'

describe Domain do

  context "validations" do
    it "should be invalid without name" do
      domain = Domain.new
      domain.save.should be_false

      
    end

    it "should not allow duplicate name" do
      Domain.create!(:name=>"Java")
      another_domain = Domain.new(:name=>"Java")
      another_domain.save.should be_false
    end
    
  end

end
