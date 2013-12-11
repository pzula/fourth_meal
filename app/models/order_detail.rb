class OrderDetail < ActiveRecord::Base

  # validations
  validates :first_name, :last_name, :email, :phone, :delivery_city, :delivery_state, :delivery_zip, :delivery_street, :delivery_address_2, presence: true 

end
