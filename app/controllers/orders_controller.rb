class OrdersController < ApplicationController
  #before_action :require_login, except: [:new, :show, :checkout]
  before_action :require_admin, only: [:index]
  # before_action :set_order, only: [:show]

  def index
    @orders = Order.all
  end

  def new
    order = current_order
    redirect_to order_path(order)
  end

  def show
    @order = current_order
    @restaurants = @order.items.map(&:restaurant).uniq
  end

  def checkout
    @order = current_order
    @items = @order.items
    @order_items = @order.order_items
    unless current_user   
      @amount = (@order.subtotal * 100).to_i
      render "guest_checkout"
    else
      current_user.associate_order(current_order)
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
