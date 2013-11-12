class Order < ActiveRecord::Base
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user

  def self.pending
    where(status: "pending")
  end

  def total_items
    order_items.inject(0) do |sum, order_item|
      sum + order_item.quantity
    end
  end

end
