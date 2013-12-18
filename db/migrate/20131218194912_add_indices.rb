class AddIndices < ActiveRecord::Migration
  def change
    add_index :item_categories, :item_id
    add_index :item_categories, :category_id
    add_index :orders, :status
    add_index :restaurant_details, :restaurant_id
    add_index :order_restaurants, :order_id
    add_index :order_restaurants, :restaurant_id
  end
end
