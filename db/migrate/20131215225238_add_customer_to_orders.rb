class AddCustomerToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :customer, polymorphic: true, index: true
  end
end
