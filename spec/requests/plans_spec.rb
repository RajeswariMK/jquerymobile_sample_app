require 'spec_helper'

describe "Plans" do
  describe "GET /plans" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get plans_path
      response.status.should be(302)
    end
     before(:each) do
     visit login_url
     fill_in "password", :with => "admin_pass"
     click_button 'Login'
   end
    it "displays plans" do
      Plan.create!(:name => "sample", :email => "test@mail.com", :phone => "1234", :description => "sample sample")  
      visit plans_path  
      page.should have_content("sample")  
    end
    it "Create plan" do
      visit new_plan_path
      fill_in "plan_name", :with => "sample"
      fill_in "plan_email", :with => "sample@mail.com"
      fill_in "plan_phone", :with => "12345677"
      fill_in "plan_description", :with => "sample sample sample"
      attach_file('file','F:/bugsandpics/11.pdf')
      click_button 'Submit'
      page.should have_content("Plan successfully submitted.")
    end
    
    it "should rediect to index page" do
      visit new_plan_path
      page.should have_link('Manage Business Plans')
    end
    it "should redirect to show page on submit" do
      post_via_redirect '/connect', :plan => @plan
      page.should have_no_content("Plan successfully submitted.")  
    end
    it "edit plans" do
       @plan = Factory(:plan)
       visit edit_plan_path(@plan)
       page.should have_content(@plan.name)
   end
   it "show plans" do
     @plan = Factory.create(:plan)
     visit plan_path(@plan)
     page.should have_content("sample")  
   end
  end
end
