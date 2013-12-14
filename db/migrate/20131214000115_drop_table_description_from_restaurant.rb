class DropTableDescriptionFromRestaurant < ActiveRecord::Migration
  def change
    remove_column :restaurants, :description
  end
end
