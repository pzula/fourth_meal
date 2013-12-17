class OrderDetail < ActiveRecord::Base
  has_one :order, :foreign_key => :order_details_id

  # validates :first_name, :last_name, :email, :phone, :delivery_city, :delivery_state, :delivery_zip, :delivery_street, presence: true 

end
