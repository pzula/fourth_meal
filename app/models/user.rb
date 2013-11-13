class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :orders

  def associate_order(order_id)
    orders << Order.find(order_id)
  end

  def change_order_to_completed
    orders.last.update_status("completed")
  end

  def recent_orders
    orders.where(status: 'completed')
  end
end
