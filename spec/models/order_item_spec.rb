require 'spec_helper'

describe OrderItem do
  it "should require quantity above 0" do
    order = OrderItem.new(quantity: 1)
    order.should be_valid
    order = OrderItem.new(quantity: 0)
    order.should_not be_valid
    order = OrderItem.new(quantity: -1)
    order.should_not be_valid
  end

  it "should have a quantity that is an integer" do
    order = OrderItem.new(quantity: 1.1)
    order.should_not be_valid
  end
end
