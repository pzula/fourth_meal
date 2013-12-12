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

  # it "has method item_restaurant" do
  #   restaurant = FactoryGirl.create(:restaurant)
  #   item1 = FactoryGirl.create(:item_unique, title: "Bread", restaurant: restaurant)
  #   order_item1 = FactoryGirl.create(:order_item, item_id: item1)
  #   item2 = FactoryGirl.create(:item_unique, title: "Sweets", restaurant: restaurant) 
  #   inactive_item = FactoryGirl.create(:item, title: "Eggs")
  #   expect(Item.find_by_restaurant(restaurant.id).count).to eq(2)
  # end
end
