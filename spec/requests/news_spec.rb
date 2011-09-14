require 'spec_helper'

describe "News" do
  describe "GET /news" do
    before(:each) do
     @news = Factory(:news)
   end
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get news_index_path
      response.status.should be(200)
    end
    it "show news" do
     visit news_path(@news)
     page.should have_content("Sample description")  
   end
   it "displays News" do
     visit news_path(@news)
     page.should have_content(@news.description)
   end
   it "edit news" do
     visit edit_news_path(@news)
     page.should have_content(@news.description)
   end
 end
 describe "Testing admin" do
   before(:each) do
     @news = Factory(:news)
   end
   before(:each) do
     visit login_url
     fill_in "password", :with => "admin_pass"
     click_button 'Login'
   end
   it "should show index page" do
     visit news_index_path
     page.should have_content(@news.description)
   end
   it "Create news" do
      visit news_index_path
      click_link "Create a News"
      fill_in "news_description", :with => "sample sample"
      check('news_show')
      click_button 'Create News'
      page.should have_content("News was successfully created.")
  end
  it "should rediect to index page" do
      visit new_news_path
      page.should have_content('Create News')
    end
    it "should redirect to show page on submit" do
      visit news_path(@news)
      page.should have_content(@news.description)  
    end
    it "edit plans" do
       visit edit_news_path(@news)
       fill_in "news_description", :with => "sample sample"
       click_button 'Update News'
       page.should have_content("News was successfully updated.")
   end
 end
end
