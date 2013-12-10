class RestaurantsController < ApplicationController

  def show 
    set_cookie
    @restaurant = Restaurant.find(params[:id])
    @items = @restaurant.items
    if cookies[:order_id]
      @order = Order.find(cookies[:order_id])
    end
  end
end
