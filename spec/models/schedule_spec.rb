require 'spec_helper'

describe Schedule do
  it { should belong_to :user }
  it { should belong_to :domain }
end
