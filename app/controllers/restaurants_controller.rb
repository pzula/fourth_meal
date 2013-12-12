class RestaurantsController < ApplicationController

  def show 
    set_order_cookie
    @restaurant = Restaurant.find(params[:id])
    cookies[:restaurant_slug] = @restaurant.url_slug
    cookies[:restaurant_id] = @restaurant.id
    @items = @restaurant.items
  end

  def index
    @restaurants = Restaurant.where(:status => "approved")
  end
end
