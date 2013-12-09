class OrdersController < ApplicationController
  #before_action :require_login, except: [:new, :show, :checkout]
  before_action :require_admin, only: [:index]
  before_action :set_order, only: [:show]
  
  def index
    @orders = Order.all
  end

  def new
    order = Order.create
    cookies[:order_id] = order.id
    redirect_to items_path
  end

  def show
    @order_items = @order.order_items
  end

  def guest_checkout
    render "guest_checkout"
  end

  def checkout
    unless current_user
      guest_checkout
      #redirect_to "/orders/guest_checkout"
     #flash.notice = "Login is required to checkout"
     #redirect_to login_path
      # confirm_guest_checkout
      # current_user = User.guest_user("joe@email.com")
    else
      current_user.associate_order(cookies[:order_id])
      @order = Order.where(user_id: current_user.id).last
      @items = @order.items
    end
  end

  def place_order
    current_user.change_order_to_completed
    flash.notice = "Your order is successfull"
    cookies.delete :order_id
    UserMailer.order_email(current_user, current_user.orders.last).deliver
    redirect_to user_path(current_user)
  end

  private

  def set_order
    if cookies[:order_id]
      @order = Order.find(cookies[:order_id])
    elsif params[:id]
      @order = Order.find(params[:id])
    end
  end
end
