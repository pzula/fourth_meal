class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :customer_type, :default => "guest"
      
      t.timestamps
    end
  end
end
