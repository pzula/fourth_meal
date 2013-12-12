class RestaurantEmployeesController < ApplicationController
  before_action :require_login

  def new
    @restaurant_employee = RestaurantEmployee.new
  end

  def create
    @restaurant_employee = RestaurantEmployee.new(restaurant_employee_params)
    @restaurant_employee.save
  end

  private

  def restaurant_employee_params
    params.require(:restaurant_employee).permit(:restaurant_id, :user_id, :stocker, :admin)
  end

end
