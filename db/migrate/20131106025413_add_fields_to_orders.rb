class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string, default: "pending"
  end
end
