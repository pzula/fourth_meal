require 'spec_helper'

describe Order do

  it "should find pending orders" do
    expect(Order.all.count).to eq(0)
    user = FactoryGirl.create(:user)
    order = FactoryGirl.create(:order, user: user)
    expect(Order.all.count).to eq(1)
    expect(Order.pending.count).to eq(1)
    order = FactoryGirl.create(:order, user: user, status: "paid")
    expect(Order.all.count).to eq(2)
    expect(Order.pending.count).to eq(1)
  end

  it "should hold items" do
    user = FactoryGirl.create(:user)
    order = FactoryGirl.create(:order, user: user)
    item1 = FactoryGirl.create(:item, title: "Bacon")
    item2 = FactoryGirl.create(:item, title: "Eggs")
    item3 = FactoryGirl.create(:item, title: "Hot Pockets")
    order_item1 = FactoryGirl.create(:order_item, item: item1, order: order)
    order_item2 = FactoryGirl.create(:order_item, item: item2, order: order)
    order_item3 = FactoryGirl.create(:order_item, item: item3, order: order)
    expect(order.items.count).to eq(3)
    expect(order.items.first.title).to eq("Bacon")
  end
  
  it "should count total number of items" do
    user = FactoryGirl.create(:user)
    order = FactoryGirl.create(:order, user: user)
    item1 = FactoryGirl.create(:item, title: "Bacon")
    item2 = FactoryGirl.create(:item)
    order_item1 = FactoryGirl.create(:order_item, item: item1, order: order, quantity: 3)
    order_item2 = FactoryGirl.create(:order_item, item: item2, order: order)
    expect(order.total_items).to eq(4)
  end

  it "should have order_items by restaurant method" do
    user = FactoryGirl.create(:user)
    order = FactoryGirl.create(:order, user: user)
    platable = FactoryGirl.create(:restaurant, name: "Platable", url_slug: "platable")
    dive_bar = FactoryGirl.create(:restaurant, name: "Dive Bar", url_slug: "dive_bar")
    platable_id = platable.id.to_i
    dive_bar_id = dive_bar.id.to_i
    item1 = FactoryGirl.create(:item_unique, title: "Deviled Eggs", description: "twelve luscious eggs", price: 1, restaurant: platable)
    item2 = FactoryGirl.create(:item_unique, title: "Waffles", description: "syrup", price: 3, restaurant: platable)
    item3 = FactoryGirl.create(:item_unique, title: "quinoa", description: "grainy", price: 9, restaurant: dive_bar)
    order_item1 = FactoryGirl.create(:order_item, item: item1, order: order, quantity: 3)
    order_item2 = FactoryGirl.create(:order_item, item: item2, order: order)
    order_item3 = FactoryGirl.create(:order_item, item: item3, order: order, quantity: 3)
    expect(order.find_order_items_by_restaurant_id(order, platable_id).count).to eq(2)
    expect(order.find_order_items_by_restaurant_id(order, dive_bar_id).count).to eq(1)
  end
end
