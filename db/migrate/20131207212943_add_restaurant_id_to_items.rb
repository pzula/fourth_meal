class AddRestaurantIdToItems < ActiveRecord::Migration
  def change
    add_reference :items, :restaurant, index: true
  end
end
