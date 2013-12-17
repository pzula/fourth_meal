class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_admin
    if current_user
      unless current_user.admin
        redirect_to user_path(current_user)
      end
    end
  end

  def current_order
    @order ||= lookup_order || create_order
  end

  def lookup_order
    if session[:order_id]
      Order.find(session[:order_id])
    end
  end

  def create_order
    if current_user
      order = current_user.orders.create
    else
      guest = Guest.create
      order = guest.orders.create
    end

    session[:order_id] = order.id
    return order
  end

end

