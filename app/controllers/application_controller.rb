class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_admin
    if current_user
      unless current_user.admin
        #redirect_to user_path(current_user)
        redirect_to "http://lmgtfy.com/?q=How+do+I+reach+unauthorized+pages+on+Platable%3F"
      end
    end
  end
end
