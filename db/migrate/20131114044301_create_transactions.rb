class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :total

      t.timestamps
    end
  end
end
