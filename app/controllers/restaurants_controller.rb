class RestaurantsController < ApplicationController
  
  def index
    @restaurants = Restaurant.where(:status => "approved")
    @pending_restaurants = Restaurant.where(:status => "pending")
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @user_id = current_user.id
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
      set_restaurant_admin
    else
      redirect_to restaurants_path
    end
    # @restaurant_employee = Restaurant_employee.new(:restaurant_id)
  end

  def show 
    set_order_cookie
    @restaurant = Restaurant.find(params[:id])
    cookies[:restaurant_slug] = @restaurant.url_slug
    cookies[:restaurant_id] = @restaurant.id
    @items = @restaurant.items
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :url_slug, :food_type, :status)
  end

  def set_restaurant_admin
    @admin = RestaurantEmployee.new
    @admin.user_id = current_user.id
    @admin.restaurant_id = @restaurant.id
    @admin.admin = true
    @admin.save
  end
end
