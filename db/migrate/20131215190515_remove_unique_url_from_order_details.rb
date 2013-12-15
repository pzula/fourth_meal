class RemoveUniqueUrlFromOrderDetails < ActiveRecord::Migration
  def change
    remove_column :order_details, :unique_url
  end
end
