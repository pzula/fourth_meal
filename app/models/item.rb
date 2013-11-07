class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :categories, through: :item_categories
  has_many :item_categories
  validates_presence_of :title, :description, :price

  def self.active
    where(active: true)
  end
end
