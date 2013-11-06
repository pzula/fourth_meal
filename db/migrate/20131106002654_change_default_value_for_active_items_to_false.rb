class ChangeDefaultValueForActiveItemsToFalse < ActiveRecord::Migration
  def change
    change_column :items, :active, :boolean, default: true
  end
end
