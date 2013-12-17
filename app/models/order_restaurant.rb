class OrderRestaurant < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :order

  # validations
  # validates :first_name, :last_name, :email, :phone, :delivery_city, :delivery_state, :delivery_zip, :delivery_street, presence: true 

end
