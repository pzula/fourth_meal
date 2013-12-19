class Location < ActiveRecord::Base
  has_many :restaurants

  def restaurant_count
    restaurants.count
  end

end


