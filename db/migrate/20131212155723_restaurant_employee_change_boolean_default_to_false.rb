class RestaurantEmployeeChangeBooleanDefaultToFalse < ActiveRecord::Migration
  def change
    change_column_default :restaurant_employees, :admin, false
    change_column_default :restaurant_employees, :stocker, false
  end
end
