class AddOrderDetailIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :order_details_id, :integer 
  end
end
