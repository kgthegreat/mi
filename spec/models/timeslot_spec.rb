require 'spec_helper'

describe Timeslot do
  it { should validate_presence_of :date }
  it { should validate_presence_of :start_time }
  it { should belong_to :trainer }
end

