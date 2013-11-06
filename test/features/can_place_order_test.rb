require './test/test_helper'

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

  # test "can create a new order" do
  #   item = {title: "cookie", description: "chocolate chip",
  #                       price: "3", category: "dessert"}
  #   Order.create({user_id: 2, status: "paid", items: Item.create(item)})
  # end


end
