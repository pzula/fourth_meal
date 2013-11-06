class AddQuantityToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :quantity, :integer, default: 1
  end
end
