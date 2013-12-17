class ItemsController < ApplicationController

  before_action :require_login, except: [:index, :show, :add_to_order]
  before_action :require_admin, except: [:index, :show, :add_to_order]

  def index
    redirect_to new_order_path unless cookies[:order_id]
    if params["Categories"]
      @category = Category.find(params["Categories"])
      @items = Item.active.find_all {|item| item.categories.include? @category}
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
    unless current_user.admin?
      @restaurants = current_user.restaurants
    else
      @restaurants = Restaurant.all
    end
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
    unless current_user.admin?
      @restaurants = current_user.restaurants
    else
      @restaurants = Restaurant.all
    end
  end

  def update
    @item = Item.update(params[:id], item_params)
    @item.update_categories(params[:item][:category])
    redirect_to items_path
  end

  def add_to_order
    order = Order.find(cookies[:order_id])
    item = Item.find(params[:id])
    Item.add_item_or_update(order, item)
    flash.notice = item.title + " added to cart!"
    redirect_to :back
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :active, :restaurant_id)
  end

end
