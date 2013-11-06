class Item < ActiveRecord::Base
  validates_presence_of :title, :description, :price, :category

  def self.active
    where(active: true)
  end
end
