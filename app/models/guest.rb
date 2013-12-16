class Guest < ActiveRecord::Base
  has_many :orders, as: :customer
end
