require 'spec_helper'

describe "news/show.html.erb" do
  before(:each) do
    @news = assign(:news, stub_model(News,
      
      :description => "MyText",
      :show => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
