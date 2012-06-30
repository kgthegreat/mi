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
    it "should return the list of timeslots which are approved" do
      create :timeslot
      create :timeslot, :trainer => (create :trainer, :email => "so@so.com"), :approved => true
      create :timeslot, :schedule_id => "3", :trainer => (create :trainer, :email => "soe@so.com")
      Timeslot.approved.count.should eq 1
    end
    it "should return the list of timeslots in chronological order" do
      ts1 = create :timeslot
      ts2 = create :timeslot, :trainer => (create :trainer, :email => "so@so.com"), :approved => true, :date=>"21-5-2012"
      ts3 = create :timeslot, :schedule_id => "3", :trainer => (create :trainer, :email => "soe@so.com"), :date => "20-5-2012"
      Timeslot.chrono.count.should eq 3
      Timeslot.chrono.should eq [ts1,  ts3, ts2]
    end

  end
end

