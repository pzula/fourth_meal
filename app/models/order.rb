class Order < ActiveRecord::Base
  require 'securerandom'
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :order_detail
  belongs_to :customer, polymorphic: true
  has_many :order_restaurants
  has_many :restaurants, through: :order_restaurants

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

  def generate_unique_url
    update(:unique_url => SecureRandom.hex)
  end

  def order_username(customer_id)
    User.find(customer_id).username
  end

  def place
    update_status("completed")
    notifier.order_placed(customer, self)
  end

  def notifier
    USER_NOTIFIER.new
  end
end

class UserNotifierEmail
  def order_placed(customer, self)
    UserMailer.order_email(customer, self).deliver
  end
end

class UserNotifierFake
  def order_placed(customer, self)
    true
  end
end
