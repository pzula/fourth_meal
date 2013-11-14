class UserMailer < ActionMailer::Base
  default from: "customer_service@platable.com"

  def welcome_email(user)
    @user = user
    @url = "platable.herokuapp.com/login"
    mail(to: @user.email, subject: "Welcome to Platable")
  end

  def order_email(user, order)
    @user = user
    @order = order
    @items = order.items
    @url = "platable.herokuapp.com"
    mail(to: @user.email, subject: "Your Grub is Forthcoming!")
  end
end
