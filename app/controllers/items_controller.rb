class ItemsController < ApplicationController
  include ItemsHelper

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

  def edit
    @item = Item.find(params[:id])

  end

  def update
    @item = Item.update(params[:id], item_params)
    redirect_to items_path
  end

end
