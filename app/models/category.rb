class Category < ActiveRecord::Base
  has_many :item_categories
  has_many :items, through: :item_categories
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
end
