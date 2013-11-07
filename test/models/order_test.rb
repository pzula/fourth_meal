require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  test "it finds pending orders" do
    item1 = {title: "cookie", description: "chocolate chip",
                        price: "3"}
    item2 = item1.merge({description: "coconut macoroons"})
    item3 = item1.merge({description: "chewy chocolate oatmeal"})
    order = Order.new
    order.save
    order.items.create(item1)
    order.items.create(item2)
    order.items.create(item3)
    assert_equal 3, order.items.count
    item1 = {title: "ice cream", description: "chocolate chip",
                        price: "3"}
    item2 = item1.merge({description: "rocky road"})
    item3 = item1.merge({description: "butter pecan"})
    ice_cream = Order.new({status: "paid"})
    ice_cream.save
    ice_cream.items.create(item1)
    ice_cream.items.create(item2)
    ice_cream.items.create(item3)
    assert_equal 2, Order.all.count
    assert_equal 1, Order.pending.count
  end

  test "it can create a new order" do
    item1 = {title: "cookie", description: "chocolate chip",
                        price: "3"}
    item2 = item1.merge({description: "coconut macoroons"})
    item3 = item1.merge({description: "chewy chocolate oatmeal"})
    new_item1 = Item.new(item1)
    new_item2 = Item.new(item2)
    new_item3 = Item.new(item3)
    order = Order.new
    order.save
    order.items << new_item1
    order.items << new_item2
    order.items << new_item3
    assert_equal 3, order.items.count
    assert_equal "chocolate chip", order.items.first.description
  end

  test "it can find it's quantity" do
    item1 = {title: "cookie", description: "chocolate chip",
                        price: "3"}
    new_item = Item.create(item1)

    order = Order.create
    order.items << new_item
    assert_equal 1, order.total_items
  end

end
