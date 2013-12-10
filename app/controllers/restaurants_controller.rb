class RestaurantsController < ApplicationController

  def show 
    set_order_cookie
    @restaurant = Restaurant.find(params[:id])
    cookies[:restaurant_slug] = @restaurant.url_slug
    @items = @restaurant.items
    if cookies[:order_id]
      @order = Order.find(cookies[:order_id])
    end
  end
end
