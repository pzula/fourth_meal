class RestaurantsController < ApplicationController
  before_action :require_login, except: [:index, :show, :restaurant_admin]
  before_action :require_admin, only: [:approve]

  def index
    @restaurants = Restaurant.where(:status => "approved")
    @pending_restaurants = Restaurant.where(:status => "pending")
  end

  def new
    @restaurant = Restaurant.new
    @restaurant_detail = RestaurantDetail.new
    @hours = Hours.new
  end

  def create
    @user_id = current_user.id
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant_detail = RestaurantDetail.new(restaurant_detail_params)
    @hours = Hours.new
    if @restaurant.save
      @restaurant_detail.restaurant_id = @restaurant.id
      @restaurant_detail.save
      @hours.days.each do |day|
        hours_info = hours_params(day)
        @hours = Hours.new(hours_info)
        @hours.restaurant_id = @restaurant.id
        @hours.day = day
        @hours.save
      end
      redirect_to restaurants_path
      flash.notice = "#{@restaurant.name} was successfully created!"
      set_restaurant_admin
      RestaurantMailer.restaurant_created(current_user, @restaurant).deliver
      RestaurantMailer.restaurant_created_admin_notification(@restaurant).deliver
    else
      flash.notice = "#{@restaurant.name} application was incomplete!"
      redirect_to restaurants_path
    end
  end

  def show
    @order = current_order
    @restaurant = Restaurant.find(params[:id])
    cookies[:restaurant_slug] = @restaurant.url_slug
    cookies[:restaurant_id] = @restaurant.id
    @items = @restaurant.items
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    if params[:restaurant][:status]
      @status = params[:restaurant][:status]
      @restaurant = Restaurant.find(params[:id])
      @restaurant.status = @status
      restaurant_admin = @restaurant.restaurant_employees.first
      @user = restaurant_admin.user
      @restaurant.save
      if @status == "approved"
        RestaurantMailer.restaurant_approved(@user, @restaurant).deliver
      else
        RestaurantMailer.restaurant_denied(@user, @restaurant).deliver
        @restaurant.destroy
      end
    else
      @restaurant = Restaurant.find(params[:id])
      @restaurant.update(restaurant_params)
    end
    redirect_to restaurants_path
  end

  def approve
    @restaurant = Restaurant.find(params[:id])
    @user = current_user
  end

  def restaurant_dashboard
    @restaurant = current_user.restaurants.find(params[:id])
    @restaurant_id = @restaurant.id
    @items = @restaurant.items
    @all_hours = @restaurant.get_hours(@restaurant)
    @hours = @all_hours.first
  end

  private

  def update_status
    params.require(:restaurant).permit(:status)
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :url_slug, :food_type)
  end

  def restaurant_detail_params
    params[:restaurant].require(:restaurant_detail).permit(:restuarant_id, :phone, :street, :street2, :city, :state, :zip, :description, :hours_id, :delivery, :delivery_range)
  end

  def hours_params(day)
    params[:restaurant].require(day.to_sym).permit(:restaurant_id, :start_at, :end_at, :closed)
  end

  def set_restaurant_admin
    @admin = RestaurantEmployee.new
    @admin.user_id = current_user.id
    @admin.restaurant_id = @restaurant.id
    @admin.admin = true
    @admin.save
  end
end
