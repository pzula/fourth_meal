class CreateRestaurantEmployeeTable < ActiveRecord::Migration
  def change
    create_table :restaurant_employees do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.boolean :stocker, default: true
      t.boolean :admin, default: true
    end
  end
end
