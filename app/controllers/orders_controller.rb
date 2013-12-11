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
    @order_id = cookies[:order_id]
    @order = Order.find(@order_id)
    @restaurants = @order.items.map(&:restaurant).uniq
  end

  def checkout_one_restaurant
    @order_id = cookies[:order_id]
    @order = Order.find(@order_id)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @items = @order.items.find_by_restaurant(params[:restaurant_id]).uniq!
    @order_items = @order.order_items.select{ |oi| oi.restaurant == @restaurant }
    @amount = (@order.subtotal_per_restaurant(@order_items) * 100).to_i
    unless current_user
      @details = OrderDetail.new
      render "guest_checkout"
    else 
      render "checkout"
    end
  end

  def checkout
    unless current_user
      @order_id = cookies[:order_id]
      @order = Order.find(@order_id)
      @order_items = @order.order_items
      @items = @order.items
      @amount = (@order.subtotal * 100).to_i

      @details = OrderDetail.new
      render "guest_checkout"
    else
      current_user.associate_order(cookies[:order_id])
      @order = Order.where(user_id: current_user.id).last
      @items = @order.items
      @order_items = @order.order_items
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
