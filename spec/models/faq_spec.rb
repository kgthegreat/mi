require 'spec_helper'

describe Faq do
  it "should save successfully with a question and an answer" do
    faq = Faq.new(:question => "some", :answer => "coolans")
    faq.save.should be_true
    
  end
  it "should not save without an answer" do
    faq = Faq.new(:question => "some", :answer => "")
    faq.save.should be_false
  end
  it "should not save without a question" do
    faq = Faq.new(:question => "", :answer => "answer")
    faq.save.should be_false
  end
  
end
