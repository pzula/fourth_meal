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
    end
  end

end
