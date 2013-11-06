require 'test_helper'

class OrdersControllerTest < ActionController::TestCase

  test "it stores order in cookie" do
    # 1. if there is an order stored in this cookie
    # 2. then add the associated item to that order
    # 3. otherwise, create a new order and store in cookie
    # 4. then add the item to to that order
    item = {title: "cookie", description: "chocolate chip",
                        price: "3", category: "dessert"}
    new_item = Item.create(item)
    order = Order.create
    cookies[:order_id] = order.id
    order.items << new_item
    get :show, id: cookies[:order_id]
    assert_response :success
  end

end
