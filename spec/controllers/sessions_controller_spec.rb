require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
 
  describe "GET 'create'" do
    it "should be redirect to index path" do
      #get 'create'
      #response.should be_success
      session.stub(:password).and_return('admin_pass')
	  get :create
      response.should redirect_to(news_index_path)
    end
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      get :destroy
      response.should redirect_to('/')
    end
  end

end
