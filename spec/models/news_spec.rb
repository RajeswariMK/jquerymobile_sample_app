require 'spec_helper'

describe News do
  before(:all) do
    @news = Factory(:news)
  end
  it "should be valid" do
    @news.should be_valid
  end
end
