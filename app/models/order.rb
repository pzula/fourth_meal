class Order < ActiveRecord::Base
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user

  def find_order_items_by_restaurant_id(order, restaurant_id)
    self.order_items.select do |oi|
      oi.item.restaurant.id.to_i == restaurant_id
    end
  end

  def self.pending
    where(status: "pending")
  end

  def total_items
    order_items.inject(0) do |sum, order_item|
      sum + order_item.quantity
    end
  end

  def update_status(new_status)
    Order.update(self.id, status: new_status)
  end

  def subtotal
    order_items.inject(0) do |sum, order_item|
      item_price = Item.find(order_item.item_id).price
      sum + order_item.quantity * item_price
    end
  end

  def subtotal_per_restaurant(order_items_per_restaurant)
    order_items_per_restaurant.inject(0) do |sum, order_item|
      item_price = Item.find(order_item.item_id).price
      sum + order_item.quantity * item_price
    end
  end

end
