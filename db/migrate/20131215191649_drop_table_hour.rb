class DropTableHour < ActiveRecord::Migration
  def change
    rename_table :hour, :hours
  end
end
