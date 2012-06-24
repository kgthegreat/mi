require 'spec_helper'

describe Trainer do
  it { should have_many(:timeslots) }
  it { should have_and_belong_to_many :domains}
end
