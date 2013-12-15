class AddUserRefToCustomers < ActiveRecord::Migration
  def change
    add_reference :customers, :user, index: true
  end
end
