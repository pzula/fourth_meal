class UserSessionsController < ApplicationController

  def new
  end

  def create
    if login(params[:username], params[:password])
      flash.notice = "Successfully logged in as #{current_user.username}"
      current_user.associate_order(cookies[:order_id]) if cookies[:order_id]
      redirect_to items_path
    else
      flash.notice = "Login failed"
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash.notice = "Logged out"
    redirect_to items_path
  end
end
