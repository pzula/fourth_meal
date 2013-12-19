class AddMoreIndices < ActiveRecord::Migration
  def change
    add_index :restaurants, :location_id
    add_index :restaurant_employees, :user_id
    add_index :restaurant_employees, :restaurant_id
    add_index :hours, :restaurant_id
  end
end
