class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :url_slug
      t.string :status, :default => "pending"

      t.timestamps
    end
  end
end
