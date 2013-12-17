class OrdersController < ApplicationController
  #before_action :require_login, except: [:new, :show, :checkout]
  before_action :require_admin, only: [:index]
  # before_action :set_order, only: [:show]

  def index
    @orders = Order.all
  end

  def new
    order = current_order
    order.generate_unique_url
    redirect_to items_path
  end

  def show
    @order = current_order
    @restaurants = @order.items.map(&:restaurant).uniq
  end

  def checkout_one_restaurant
    @order = current_order
    @restaurant = Restaurant.find(params[:restaurant_id])
    restaurant_id = @restaurant.id
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
    @order = current_order
    unless current_user
      @order_items = @order.order_items
      @items = @order.items
      @amount = (@order.subtotal * 100).to_i

      @details = OrderDetail.new
      render "guest_checkout"
    else
      current_user.associate_order(current_order)
      @items = @order.items
      @order_items = @order.order_items
    end
  end

  def place_order
    current_order.update_status("completed")
    flash.notice = "Your order is successfull"
    UserMailer.order_email(current_user, current_user.orders.last).deliver
    create_order
    redirect_to user_path(current_user)
  end

  def guest_order_receipt
    @order = Order.find_by(:unique_url => params[:unique_url])
    @items = @order.items
  end

  private

end
