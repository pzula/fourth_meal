class ChangeColumnInHours < ActiveRecord::Migration
  def change
    change_column :hours, :day, :string
  end
end
