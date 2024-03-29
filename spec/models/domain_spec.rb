require 'spec_helper'

describe Domain do

  context "validations" do
    it {should validate_presence_of :name}

    it "should not allow duplicate name" do
      create :domain
      should validate_uniqueness_of :name
    end


    
  end

  context "associations" do
    it { should have_many :schedules }
    it {should have_and_belong_to_many :trainers}
  end
  

end
