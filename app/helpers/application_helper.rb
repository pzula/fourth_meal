module ApplicationHelper

  def print_price(price)
    number_to_currency price
  end

  def order_items_by_order(restaurant, order_id)
    restaurant.order_items.where('order_id' => order_id)
  end

end

