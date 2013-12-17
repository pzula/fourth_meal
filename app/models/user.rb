class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :orders, as: :customer
  has_many :restaurant_employees
  has_many :restaurants, :through => :restaurant_employees

  validates_presence_of     :password, :on => :create
  validates                 :password, length: { minimum: 6 }
  validates                 :username, length: { in: 2..32 }
  validates_presence_of     :email

  def associate_order(order)
    orders << order
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


end
