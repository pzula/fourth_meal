class Customer < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  validates_presence_of :customer_type
end
