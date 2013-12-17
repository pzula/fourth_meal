class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :find_order

  def require_admin
    if current_user
      unless current_user.admin || current_user.restaurant_employees.any?
        redirect_to user_path(current_user)
      end
    end
  end

  def set_order_cookie
   unless cookies[:order_id]
     order = Order.create
     order.generate_unique_url
     cookies[:order_id] = order.id
     order
   end
  end

  def find_order
    if current_user
      @order = current_user.orders.last
    elsif cookies[:order_id]
      @order = Order.find_by_id(cookies[:order_id])
    else
      @order = set_order_cookie
    end
  end
end

