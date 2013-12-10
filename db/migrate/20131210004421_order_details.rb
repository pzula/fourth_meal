class OrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :delivery_street
      t.string :delivery_address_2
      t.string :delivery_city
      t.string :delivery_state
      t.string :delivery_zip
      t.string :billing_street
      t.string :billing_address_2
      t.string :billing_city
      t.string :billing_state
      t.string :billing_zip
    end
  end
end
