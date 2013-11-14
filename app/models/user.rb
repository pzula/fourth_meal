class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
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
