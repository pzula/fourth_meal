class ItemsController < ApplicationController

  def index
    @items = Item.active
    if cookies[:order_id]
      @order = Order.find(cookies[:order_id])
    else
      @order = nil
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to items_path
  end

  def show
    @item = Item.find(params[:id])
    if cookies[:order_id]
      @order = Order.find(cookies[:order_id])
    else
      @order = nil
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.update(params[:id], item_params)
    redirect_to items_path
  end

  def add_to_order
    order = Order.find(cookies[:order_id])
    item = Item.find(params[:id])
    if order.items.include? item
      order_item = OrderItem.where(order_id:order.id, item_id:item.id).first
      new_quantity = order_item.quantity + 1
      order_item.update(quantity: new_quantity)
    else
      order.items << item
    end
    redirect_to :back
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :category)
  end

end
