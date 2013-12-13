class RestaurantEmployee < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  def admin?
    admin
  end

  def stocker?
    stocker
  end
end
