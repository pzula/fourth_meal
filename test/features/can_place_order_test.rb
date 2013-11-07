require './test/test_helper'
require 'pry'
class CanPlaceOrderTest < Capybara::Rails::TestCase

  test "can see current orders" do
    item = {title: "cookie", description: "chocolate chip",
                        price: "3", category: "dessert"}
    order = Order.new
    order.save
    order.items.create(item)
    visit orders_path
    within("#orders") do
      assert_content page, "cookie"
      assert_content page, "pending"
    end
  end

  test "can add an item to the current order" do
    item = Item.new(title: 'Deviled Eggs', description: '12 luscious eggs', price: '1', category:'egg')
    item.save
    visit root_path
    within("#item_1") do
      click_on "Add to Cart"
    end

    assert_content page, "Deviled Eggs added to cart!"
  end

  test "can add multiple items to order without logging in" do
    Item.create(title: 'Deviled Eggs', description: '12 luscious eggs', price: '1', category:'egg')
    Item.create(title: 'Hard Boiled Eggs', description: '12 hard eggs', price: '1', category:'egg')
    visit root_path
    within("#item_1") do
      click_on "Add to Cart"
    end
    within("#item_2") do
      click_on "Add to Cart"
    end

    visit order_path(Order.first)
    within("#item_1") do
      assert_content page, "Deviled Eggs"
    end
    within("#item_2") do
      assert_content page, "Hard Boiled Eggs"
    end
  end

  test "can add multiple instances of same item to order" do
    Item.create(title: 'Deviled Eggs', description: '12 luscious eggs', price: '1', category:'egg')
    Item.create(title: 'Hard Boiled Eggs', description: '12 hard eggs', price: '1', category:'egg')

    visit root_path
    within("#item_1") do
      click_on "Add to Cart"
    end
    within("#item_1") do
      click_on "Add to Cart"
    end

    visit order_path(Order.first)
    within("#item_1") do
      assert_content page, "Quantity: 2"
    end
  end

  test "user can adjust items in cart" do
    item = Item.create(title: 'Deviled Eggs', description: '12 luscious eggs', price: '1', category:'egg')
    order = Order.create
    order.items << item
    visit order_path(order)

    within("#item_1") do
      fill_in "Quantity", with: 10
      click_on "Adjust Quantity"
    end

    within("#item_1") do
      assert_content page, "Quantity: 10"
    end
  end


end
