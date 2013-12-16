class CreateLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
    end
  end
end
