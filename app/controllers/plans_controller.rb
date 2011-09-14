class PlansController < ApplicationController

 before_filter :authorize, :except => [:main, :new, :create, :ourteam, :aboutus, :portfolio]
  layout "admin"
  def main
   @news = News.all
   @main = true
   respond_to do |format|
    format.mobile
    end
  end
  
  def ourteam
     respond_to do |format|
      format.mobile
    end
  end
  
  def aboutus
     respond_to do |format|
      format.mobile
    end
  end
  
  def portfolio
    respond_to do |format|
       format.mobile
    end
  end
  
  # GET /plans
  # GET /plans.xml
  def index
    @plans = Plan.order('created_at desc')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plans }
    end
  end

  # GET /plans/1
  # GET /plans/1.xml
  def show
    @plan = Plan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plan }
    end
  end

  # GET /plans/new
  # GET /plans/new.xml
  def new
    @plan = Plan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plan }
      format.mobile
    end
  end

  # GET /plans/1/edit
  def edit
    @plan = Plan.find(params[:id])
  end

  # POST /plans
  # POST /plans.xml
  def create
    @plan = Plan.new(params[:plan])
    
    respond_to do |format|
      if @plan.save
        flash[:notice] = "Plan successfully submitted."
        format.html { redirect_to :back }
          format.mobile { redirect_to :back }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /plans/1
  # PUT /plans/1.xml
  def update
    @plan = Plan.find(params[:id])

    respond_to do |format|
      if @plan.update_attributes(params[:plan])
        format.html { redirect_to(@plan, :notice => 'Plan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to(plans_url) }
      format.xml  { head :ok }
    end
  end
end
