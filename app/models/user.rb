class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :orders
  has_many :restaurant_employees
  has_many :restaurants, :through => :restaurant_employees

  def associate_order(order_id)
    orders << Order.find(order_id)
  end

  def change_order_to_completed
    orders.last.update_status("completed")
  end

  def recent_orders
    orders.where(status: 'completed')
  end

  def find_by_email(email)
    User.where(email: email).first
  end

  private

  def self.random_password
    (0...50).map{ ('a'..'z').to_a[rand(16)] }.join
  end

  def self.guest_user(params)
    user = User.new(username: "Guest", email: params, password: random_password)
    user.save
  end
end
