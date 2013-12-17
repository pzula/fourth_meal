class OrderRestaurants < ActiveRecord::Migration
  def change
    create_table :order_restaurants do |t|
      t.integer :order_id
      t.integer :restaurant_id
    end
  end
end
