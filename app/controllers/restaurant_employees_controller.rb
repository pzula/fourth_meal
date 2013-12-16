class RestaurantEmployeesController < ApplicationController
  before_action :require_login

  def new
    @restaurant_employee = RestaurantEmployee.new
  end

  def create
    if params[:email]
      restaurant = Restaurant.find(params[:restaurant_id])
      role = params[:role]
      if User.find_by_email(params[:email])
        user = User.find_by_email(params[:email])
        if role == "admin"
          @restaurant_employee = RestaurantEmployee.create!(restaurant_id: restaurant.id, admin: true, user_id: user.id)
        else
          @restaurant_employee = RestaurantEmployee.create!(restaurant_id: restaurant.id, stocker: true, user_id: user.id)
        end
        redirect_to restaurant_dashboard_path(params[:restaurant_id])
      else
        flash.notice = "This email-- #{params[:email]} is not in our system"
        redirect_to restaurant_dashboard_path(params[:restaurant_id])
      end
    else
      @restaurant_employee = RestaurantEmployee.new(restaurant_employee_params)
      @restaurant_employee.save
    end
  end

  def destroy
    @employee = RestaurantEmployee.find(params[:id])
    @employee.destroy
    notice = "Employee #{@employee.user.username}'s employment has been terminated."
    redirect_to :back, notice: notice
  end

  private

  def restaurant_employee_params
    params.require(:restaurant_employee).permit(:restaurant_id, :user_id, :stocker, :admin, :email)
  end

end
