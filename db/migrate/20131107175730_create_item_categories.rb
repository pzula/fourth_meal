class CreateItemCategories < ActiveRecord::Migration
  def change
    create_table :item_categories do |t|
      t.references :item
      t.references :category

      t.timestamps
    end
  end
end
