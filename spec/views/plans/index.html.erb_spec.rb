require 'spec_helper'

describe "plans/index.html.erb" do
  before(:all) do
    assign(:plans, [
      stub_model(Plan,
        :name => "MyText",
        :email => "MyText",
        :phone => "Phone",
        :description => "MyText"
      ),
      stub_model(Plan,
        :name => "MyText",
        :email => "MyText",
        :phone => "Phone",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of plans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s
  end
end
