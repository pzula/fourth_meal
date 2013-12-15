class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.timestamps
    end
  end
end
