class RestaurantDetail < ActiveRecord::Base
  belongs_to :restaurant, touch: true
end
