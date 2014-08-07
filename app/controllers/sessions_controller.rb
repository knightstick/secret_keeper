class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
  	if session[:user_id]
  		@user = User.find_by_id(session[:user_id])
  		redirect_to secrets_path
  	end
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
  		session[:user_id] = user.id 
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  end

end
