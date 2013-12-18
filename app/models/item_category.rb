class ItemCategory < ActiveRecord::Base
  belongs_to :item, touch: true
  belongs_to :category, touch: true
  validates :category_id, uniqueness: {:scope => :item_id}
end
