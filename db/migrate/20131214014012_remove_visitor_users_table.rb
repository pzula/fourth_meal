class RemoveVisitorUsersTable < ActiveRecord::Migration
  def change
    drop_table :visitor_users
  end
end
