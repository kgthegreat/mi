require 'spec_helper'

describe User do

  context "associations" do
    it { should have_many :schedules }
  end

end
