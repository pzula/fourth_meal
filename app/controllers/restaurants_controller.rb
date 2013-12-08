class RestaurantsController < ApplicationController

  def show 
    redirect_to new_order_path unless cookies[:order_id]
    @restaurant = Restaurant.find(params[:id])
    @items = @restaurant.items
    if cookies[:order_id] 
      @order = Order.find(cookies[:order_id])
    end
  end
end
