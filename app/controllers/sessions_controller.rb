class SessionsController < ApplicationController
layout 'admin'

  def new
   
  end

  def create
   session[:password] = params[:password]
   flash[:notice] = "Successfully logged in"
   redirect_to news_index_path
  end

 def destroy
  reset_session
  flash[:notice] = "Successfully logged out"
  redirect_to "/"
 end
end
