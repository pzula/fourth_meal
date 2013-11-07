require "./test/test_helper"

class CanRemoveOrdersTest < Capybara::Rails::TestCase

  test "user can delete orders" do
    item = Item.create(title: 'Deviled Eggs', description: '12 luscious eggs', price: '1')
    order = Order.create
    order.items << item

    visit order_path(order)

    within("#item_1") do
      click_on "Delete"
    end

    assert_content page, "Your Cart is Empty"
  end

  test "orders disappear when quantity is zero" do
    item = Item.create(title: 'Deviled Eggs', description: '12 luscious eggs', price: '1')
    order = Order.create
    order.items << item

    visit order_path(order)

    within("#item_1") do
      fill_in "Quantity", with: 0
      click_on "Adjust Quantity"
    end

    assert_content page, "There was an error"

  end
end
