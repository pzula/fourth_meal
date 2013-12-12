class RestaurantsController < ApplicationController
  before_filter :set_restaurant_admin, only: :create

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

  private

  def set_restaurant_admin
    #@user = User.find_by(current_user.id)
    @restaurant_employee.create(:restaurant_id => params, )
  end
end
