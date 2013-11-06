class Order < ActiveRecord::Base
  has_many :order_items
  has_many :items, through: :order_items
end
