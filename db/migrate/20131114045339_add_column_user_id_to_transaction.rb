class AddColumnUserIdToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :user_id, :integer
  end
end
