class Category < ActiveRecord::Base
  has_many :item_categories
  has_many :items, through: :item_categories
end
