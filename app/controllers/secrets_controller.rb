class SecretsController < ApplicationController
  def new
  end

  def index
  	@user = User.find_by_id(session[:user_id])
  end
end
