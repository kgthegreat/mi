require 'spec_helper'

describe Trainer do
  it { should have_many(:timeslots) }
end
