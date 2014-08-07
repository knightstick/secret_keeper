class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  private

  def require_login
  	unless logged_in?
  		flash[:error] = "You must log in to access this section"
  		redirect_to root_url
  	end
  end

  def logged_in?
  	true unless session[:user_id].nil?
  end
end
