require 'spec_helper'

describe NewsController do
  describe "GET new" do
     describe "admin" do
       before(:each) do
         session[:password] = 'admin_pass'
         get :new
       end
       it "should set @news" do
         assigns[:news].should_not be_nil
       end
    
       it "should assign a new news" do
         assigns[:news].should be_instance_of(News)
       end
   end
   describe "not admin" do
    it "should redirect to the index page" do
      get :new
      response.should redirect_to news_index_path
    end
  end
 end
 describe "GET show" do
     before(:each) do
      @news = Factory(:news)
    end
    it "assigns the requested news as @news" do
      News.stub(:find).and_return(@news)
      get :show, :id => @news.id
      assigns(:news).should eq(@news)
    end
  end
  describe "GET index" do
    before(:each) do
      @news = Factory(:news)
    end
    it "assigns all news as @news" do
      get :index
      response.should be_success
    end
  end
  describe "GET edit" do
    before(:each) do
      @news = Factory(:news)
    end
    describe "not admin" do
      it "should redirect to the index page" do
        News.stub(:find)
        get :edit, :id => @news.id
             
        response.should redirect_to(news_index_path)
    end
    describe "admin" do
      before(:each) do
         session[:password] = 'admin_pass'
      end
      it "assigns the requested news as @news" do
        News.stub(:find).and_return(@news)
        get :edit, :id => @news.id
        assigns(:news).should eq(@news)
      end
    end
  end
 end
 describe "PUT update" do
   before(:each) do
     @news = Factory.create(:news)
   end
   describe "not admin" do
    it "should redirect to the index page" do
      put :update, { :id => @news.id }
      response.should redirect_to(news_index_path)
    end
  end
  describe "admin" do
    before(:each) do
       session[:password] = 'admin_pass'
    end
    it "updates the requested news" do
      News.stub(:find).and_return(@news)
      put :update, { :id => @news.id }
      @news.stub(:update_attributes).and_return(true)
      assigns(:news).should eq(@news)
    end  
    it "redirects to the news" do
      put :update, :id => @news.id
      response.should redirect_to(@news)
    end
    describe "with invalid params" do
      it "assigns the news as @news" do
        @news.stub(:update_attributes).and_return(false)
        put :update, :id => @news.id
      end
      it "should redirect back to the form on an unsuccesful update" do
        News.any_instance.stub(:save).and_return(false)
        put :update, :id => @news.id, :news => {}
        response.should render_template('edit')
      end
    end
  end
 end
 describe "DELETE destroy" do
   before(:each) do
     @news = Factory.create(:news)
   end
   describe "admin" do
     before(:each) do
       session[:password] = 'admin_pass'
     end
     it "destroys the requested news" do
      News.stub(:find).and_return(@news)
      expect {
        delete :destroy, :id => @news.id
      }.to change(News, :count).by(-1)
    end

    it "redirects to the news list" do
      News.stub(:find).and_return(@news)
      delete :destroy, :id => @news
      response.should redirect_to(news_index_path)
    end
  end
  describe "not admin" do
    it "should redirect to the index page" do
      delete :destroy, :id => @news
      response.should redirect_to(news_index_path)
    end
    it "should not find the news" do
      News.should_not_receive(:find)
      delete :destroy, :id => @news
    end
  end
 end
 describe "POST create" do
   before(:each) do
    @news = Factory(:news)
  end
  describe "not admin" do
    it "should redirect to the home page" do
      post :create, :news => @news
      response.should redirect_to(news_index_path)
    end
  end
  describe "admin" do
    before(:each) do
     session[:password] = 'admin_pass'
   end
   describe "with valid params" do
     def do_post
       @ne = mock(:news, :save => true)
       News.stub!(:new).and_return(@news)
     end
     it "assigns a newly created news as @news" do
        post :create, :news => @news
        assigns(:news).should be_a(News)
    end
    it "creates a new News" do
      do_post
      News.should_receive(:new).with(@news)
      post :create, :news => @news
    end
    it "redirects to the created news" do
       do_post
       post :create, :news => @news
       response.should redirect_to(news_path(@news))
    end
  end
  describe "with invalid params" do
    it "assigns a newly created but unsaved news as @news" do
      News.any_instance.stub(:save).and_return(false)
      post :create, :news => {}
      assigns(:news).should be_a_new(News)
    end
    it "re-renders the 'new' template" do
      News.any_instance.stub(:save).and_return(false)
      post :create, :news => {}
      response.should render_template("new")
    end
  end
   
  end
 end
end
