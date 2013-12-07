class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :categories, through: :item_categories
  has_many :item_categories
  belongs_to :restaurant
  has_attached_file :image, styles: { small: "200x200" }, bucket: 'platable'
  validates_presence_of :title, :description, :price

  def self.active
    where(active: true)
  end

  def update_categories(potential_categories)
    category_ids = potential_categories ? potential_categories.values : []
    self.categories = category_ids.collect { |id| Category.find(id) }
  end

  def self.add_item_or_update(order, item)
    if order.items.include? item
      order_item = OrderItem.where(order_id:order.id, item_id:item.id).first
      new_quantity = order_item.quantity + 1
      order_item.update(quantity: new_quantity)
    else
      order.items << item
    end
  end
end
