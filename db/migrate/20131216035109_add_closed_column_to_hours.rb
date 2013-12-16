class AddClosedColumnToHours < ActiveRecord::Migration
  def change
    add_column :hours, :closed, :boolean, default: false
  end
end
