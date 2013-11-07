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

end
