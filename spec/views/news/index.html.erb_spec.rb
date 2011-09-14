require 'spec_helper'

describe "news/index.html.erb" do
  before(:each) do
    assign(:news, [
      stub_model(News,
        
        :description => "MyText",
        :show => false
      ),
      stub_model(News,
        
        :description => "MyText",
        :show => false
      )
    ])
  end

  it "renders a list of news" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
