class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :orders

  def associate_order(order_id)
    orders << Order.find(order_id)
  end
end
