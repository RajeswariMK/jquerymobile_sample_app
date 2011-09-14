class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_mobile_phone_format
  helper_method :admin?
  protected
  def admin?
     session[:password] == 'admin_pass'
  end
  def authorize
  if admin?
    true
  else
    flash[:error] = "unauthorized access"
    redirect_to news_index_path
  end
 end
  def is_mobile_request?
    smartphones = ["iphone", "blackberry", "android", "Windows Phone", "Opera Mini"]
    @is_smartphone = false
    if request.env["HTTP_USER_AGENT"]
      ua = request.env["HTTP_USER_AGENT"].to_s.downcase
      smartphones.each {|phone|
        @is_smartphone = (ua.include? phone)? true : false
        break if @is_smartphone
      } 
    end
    return @is_smartphone
  end
  
  def set_mobile_phone_format
      if is_mobile_request?
        request.format = :mobile
      end
  end
end
