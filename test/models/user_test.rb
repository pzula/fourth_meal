require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "a user is not an admin by default" do
     user = User.create({username: 'user', password: 'password'})
     refute user.admin
   end

   test "a user can be made to be an admin" do
     user = User.new({username: 'user', password: 'password'})
     user.admin = true
     user.save
     assert user.admin
   end

   test "a user can have orders" do
     user = User.create({username: 'user', password: 'password'})
     order = Order.create
     user.orders << order

     assert user.orders.include? order
   end

   test "a user can change it's order to complete" do
     user = User.create({username: 'user', email: 'user@example.com', password: 'password'})
     order = Order.create
     user.orders << order
     user.change_order_to_completed
     assert_equal "completed", user.orders.last.status
   end

   test "a user can find it's recent completed orders" do
     user = User.create({username: 'user', password: 'password'})
     order = Order.create({status: 'completed'})
     order2 = Order.create
     user.orders = [order, order2]
     user.recent_orders.each do |order|
       assert_equal 'completed', order.status
     end
   end

   test "a user must have a valid email" do
     skip
     user = User.new({username: 'user', email: 'bob', password: 'pass'})
     refute user.save
   end

end
