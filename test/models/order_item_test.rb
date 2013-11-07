require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  test "can be valid" do
    order = OrderItem.new(quantity: 1)
    assert order.valid?
  end

  test "quantity is greater than 0" do
    order = OrderItem.new(quantity: 0)
    refute order.valid?
    order = OrderItem.new(quantity: -1)
    refute order.valid?
  end

  test "quantity is an integer" do
    order = OrderItem.new(quantity: 1.1)
    refute order.valid?
  end
end
