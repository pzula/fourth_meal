class RestaurantsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  
  def index
    @restaurants = Restaurant.where(:status => "approved")
    @pending_restaurants = Restaurant.where(:status => "pending")
  end

  def new
    @restaurant = Restaurant.new
    @restaurant_detail = RestaurantDetail.new
  end

  def create
    @user_id = current_user.id
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant_detail = RestaurantDetail.new(restaurant_detail_params)
    if @restaurant.save
      @restaurant_detail.restaurant_id = @restaurant.id
      @restaurant_detail.save
      redirect_to restaurants_path
      set_restaurant_admin
      RestaurantMailer.restaurant_created(current_user, @restaurant).deliver
    else
      redirect_to restaurants_path
    end
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
    params.require(:restaurant).permit(:name, :url_slug, :food_type, :status)
  end

  def restaurant_detail_params
    params[:restaurant].require(:restaurant_detail).permit(:restuarant_id, :phone, :street, :street2, :city, :state, :zip, :description, :hours_id, :delivery, :delivery_range)
  end

  def set_restaurant_admin
    @admin = RestaurantEmployee.new
    @admin.user_id = current_user.id
    @admin.restaurant_id = @restaurant.id
    @admin.admin = true
    @admin.save
  end
end
