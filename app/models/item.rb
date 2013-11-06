class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items
  validates_presence_of :title, :description, :price, :category

  def self.active
    where(active: true)
  end
end
