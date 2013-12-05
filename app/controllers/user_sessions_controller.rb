class UserSessionsController < ApplicationController

  def new
  end

  def create
    if login(params[:username], params[:password])
      flash.notice = "Successfully logged in as #{current_user.username}"
      redirect_to root_path
    else
      flash.notice = "Login failed"
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash.notice = "Logged out"
    redirect_to root_path
  end
end
