require 'spec_helper'

describe Schedule do

  context "associations" do
    it { should belong_to :user }
    it { should belong_to :domain }
    it { should have_one :timeslot }
  end

  context "validations" do
    it {should validate_presence_of :domain_id}
  end
end