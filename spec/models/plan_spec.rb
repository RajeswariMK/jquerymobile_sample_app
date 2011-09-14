require 'spec_helper'

describe Plan do
  before(:all) do
    delete_plan
    @plan = Plan.new(:name => "sample", :email => "test@mail.com", :phone => "123345544", :description => "sample")
    
  end
  it "should be valid" do
    @plan.should be_valid
  end
  
  it "should not be nil" do
    @plan = nil
    @plan.should be_nil
  end
end
