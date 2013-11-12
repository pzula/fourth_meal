class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    order = Order.create
    cookies[:order_id] = order.id
    item = Item.find(params[:item_id])
    order.items << item
    flash.notice = order.items.last.title + " added to cart!"
    redirect_to items_path
  end

  def show
    if cookies[:order_id]
      @order = Order.find(cookies[:order_id])
    elsif params[:id]
      @order = Order.find(params[:id])
    end
    @order_items = @order.order_items
  end

  def checkout
    unless current_user
      flash.notice = "Login is required to checkout"
      redirect_to login_path
    else
      @order = Order.where(user_id: current_user.id).first
      @items = @order.items
    end
  end

  private

end
