class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :categories, through: :item_categories
  has_many :item_categories
  has_attached_file :image
  validates_presence_of :title, :description, :price

  def self.active
    where(active: true)
  end

  def update_categories(potential_categories)
    category_ids = potential_categories.values || []
    self.categories = category_ids.collect { |id| Category.find(id) }
  end
end
