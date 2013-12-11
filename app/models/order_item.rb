class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  has_one :restaurant, through: :item
  validates_numericality_of :quantity, greater_than: 0, only_integer: true

end
