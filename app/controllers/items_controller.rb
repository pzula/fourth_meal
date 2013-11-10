class ItemsController < ApplicationController

  before_action :require_admin, except: [:index, :show, :add_to_order]

  def index
    if params["Categories"]
      category = Category.find(params["Categories"])
      @items = Item.all.collect {|item| item.categories.include? category} || Item.all
    else
      @items = Item.active
    end
    @categories = Category.all
    if cookies[:order_id]
      @order = Order.find(cookies[:order_id])
    else
      @order = nil
    end
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    @item.update_categories(params[:item][:category])
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
    @categories = Category.all
  end

  def update
    @item = Item.update(params[:id], item_params)
    @item.update_categories(params[:item][:category])
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
    params.require(:item).permit(:title, :description, :price)
  end

end
