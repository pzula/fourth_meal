class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.integer :restaurant_id
      t.string :day
      t.time :start_at
      t.time :end_at
    end
  end
end
