require 'spec_helper'

describe Feedback do
  context "associations" do
    it {should belong_to :schedule}
  end
end
