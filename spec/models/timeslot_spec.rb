require 'spec_helper'

describe Timeslot do
  it { should validate_presence_of :date }
  it { should validate_presence_of :start_time }
  it { should belong_to :trainer }
  it { should belong_to :schedule }

  context "scope" do
    it "should return the list of timeslots with no schedule ids" do
      create :timeslot
      create :timeslot, :trainer => (create :trainer, :email => "so@so.com")
      create :timeslot, :schedule_id => "3", :trainer => (create :trainer, :email => "soe@so.com")
      Timeslot.available.count.should eq 2
    end
  end
end

