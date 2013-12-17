class UserMailer < ActionMailer::Base
  default from: "customer_service@craveyard.com"

  def welcome_email(user)
    @user = user
    @url = "http://craveyard.herokuapp.com/login"
    mail(to: @user.email, subject: "Welcome to Craveyard!")
  end

  def order_email(user, order)
    @user = user
    @order = order
    @items = order.items
    @url = "http://craveyard.herokuapp.com"
    mail(to: @user.email, subject: "Your Grub is Forthcoming!")
  end

  def guest_email(email, order)
    @order = order
    @url = "http://craveyard.herokuapp.com/past_orders/#{order.unique_url}"
    @items = order.items
    mail(to: email, subject: "Your Grub is Coming!")
  end
end
