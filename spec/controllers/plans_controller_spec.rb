require 'spec_helper'

describe PlansController do
   describe "GET index" do
     before(:each) do
        @plan = Factory(:plan)
     end 
    describe "admin" do
       before(:each) do
         session[:password] = 'admin_pass'
       end
       it "assigns all plans as @plans" do
        #plan = Plan.create! valid_attributes
        Plan.stub(:create).and_return(@plan)
        get :index
        assigns(:plans).should eq([@plan])
        response.should be_success
       end
    end
    describe "not admin" do
      it "should not be success" do
         get :index
         response.should_not be_success
      end
    end
  end
  
 describe "GET main" do
    before(:each) do
      @news = Factory(:news)
    end
    it "assigns all news as @news" do
      get :main
      response.should be_success
    end
  end  

  describe "GET show" do
     before(:each) do
      @plan = Factory(:plan)
    end
    describe "admin" do
       before(:each) do
         session[:password] = 'admin_pass'
       end
       it "assigns the requested plan as @plan" do
          #plan = Plan.create! valid_attributes
          Plan.stub(:find).and_return(@plan)
          get :show, :id => @plan.id
          assigns(:plan).should eq(@plan)
       end
    end 
    describe "not admin" do
      it "should not be success" do
         get :show, :id => @plan.id
         response.should_not be_success
      end
    end
  end

  describe "GET new" do
    it "assigns a new plan as @plan" do
      get :new
      assigns(:plan).should be_a_new(Plan)
    end
  end

  describe "GET edit" do
    before(:each) do
      @plan = Factory.create(:plan)
    end
    describe "admin" do
       before(:each) do
         session[:password] = 'admin_pass'
       end
    it "assigns the requested plan as @plan" do
      Plan.stub(:find).and_return(@plan)
      get :edit, :id => @plan.id
      assigns(:plan).should eq(@plan)
    end
  end
  describe "not admin" do
    it "should not edit the plan" do
       get :edit, :id => @plan.id
       response.should_not be_success  
    end
  end
  end

   describe "POST create" do
     before(:each) do
       @plan = Factory(:plan)
     end
     before(:each) do
      request.env["HTTP_REFERER"] = "/"
     end

     describe "with valid params" do
      def do_post
       @pl = mock(:plan, :save => true)
       Plan.stub!(:new).and_return(@plan)
      end
      it "assigns a newly created news as @news" do
        post :create, :news => @plan
        assigns(:plan).should be_a(Plan)
      end
      it "creates a new Plan" do
        do_post
        Plan.should_receive(:new).with(@plan)
        post :create, :plan => @plan
     end
    it "redirects to the created news" do
       do_post
       post :create, :plan => @plan
       response.should redirect_to("/")
    end
      
      it "should be a valid file" do
        files = File.open(File.join(Rails.root, "public", "samples", "sample.doc"))
        #upload = ActionController::TestUploadedFile.new(files, "application/msword")
        post :create, :plan => { :file => files }
        #@plan.stub(:has_attached_files).and_return(true)
        Factory(:plan, :file => Plan.stub!(:original_filename).and_return('sample.doc'))
        Plan.original_filename.should == "sample.doc" 
      end
    end

    describe "with invalid params" do
      
      it "assigns a newly created but unsaved plan as @plan" do
        # Trigger the behavior that occurs when invalid params are submitted
        Plan.any_instance.stub(:save).and_return(false)
        post :create, :plan => {}
        assigns(:plan).should be_a_new(Plan)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Plan.any_instance.stub(:save).and_return(false)
        post :create, :plan => {}
        response.should render_template("new")
      end
    end
  end


   describe "PUT update" do
   before(:each) do
     @plan = Factory.create(:plan)
   end
   describe "not admin" do
    it "should redirect to the index page" do
      put :update, { :id => @plan.id }
      response.should_not be_success  
    end
  end
  describe "admin" do
    before(:each) do
       session[:password] = 'admin_pass'
    end
    it "updates the requested plan" do
      Plan.stub(:find).and_return(@plan)
      put :update, { :id => @plan.id }
      @plan.stub(:update_attributes).and_return(true)
      assigns(:plan).should eq(@plan)
    end  
    it "redirects to the plan" do
      put :update, :id => @plan.id
      response.should redirect_to(@plan)
    end
    describe "with invalid params" do
      it "assigns the plan as @news" do
        @plan.stub(:update_attributes).and_return(false)
        put :update, :id => @plan.id
      end
      it "should redirect back to the form on an unsuccesful update" do
        Plan.any_instance.stub(:save).and_return(false)
        put :update, :id => @plan.id, :plan => {}
        response.should render_template('edit')
      end
    end
  end
 end

   describe "DELETE destroy" do
      before(:each) do
        @plan = Factory.create(:plan)
      end
      describe "admin" do
      before(:each) do
       session[:password] = 'admin_pass'
      end
    it "destroys the requested plan" do
      Plan.stub(:find).and_return(@plan)
      expect {
        delete :destroy, :id => @plan.id
      }.to change(Plan, :count).by(-1)
    end

    it "redirects to the plans list" do
      Plan.stub(:find).and_return(@plan)
      delete :destroy, :id => @plan
      response.should redirect_to(plans_url)
    end
   end
    describe "not admin" do
     it "should redirect to the index page" do
        delete :destroy, :id => @plan
        response.should redirect_to(news_index_path)
    end
    it "should not find the plans" do
      News.should_not_receive(:find)
      delete :destroy, :id => @plan
    end
  end 
  
end
end
