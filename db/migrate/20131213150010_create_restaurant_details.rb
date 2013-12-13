class CreateRestaurantDetails < ActiveRecord::Migration
  def change
    create_table :restaurant_details do |t|
      t.integer :restaurant_id
      t.string :phone 
      t.string :street
      t.string :street2
      t.string :city
      t.string :state
      t.integer :zip
      t.text :description
      t.integer :hours_id
      t.boolean :delivery
      t.integer :delivery_range
    end
  end
end
