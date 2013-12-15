class Hours < ActiveRecord::Migration
  def change
    create_table :hour do |t|
      t.integer :restaurant_id
      t.integer :day
      t.time :start_at
      t.time :end_at
    end
  end
end
