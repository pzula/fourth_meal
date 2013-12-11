class RemoveBillingInformationFromOrderDetails < ActiveRecord::Migration
  def change
    remove_column :order_details, :billing_street
    remove_column :order_details, :billing_address_2
    remove_column :order_details, :billing_city
    remove_column :order_details, :billing_state
    remove_column :order_details, :billing_zip
  end
end
