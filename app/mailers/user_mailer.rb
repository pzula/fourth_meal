class UserMailer < ActionMailer::Base
  default from: "customer_service@platable.com"

  def welcome_email(user)
    @user = user
    @url = "platable.herokuapp.com/login"
    mail(to: @user.email, subject: "Welcome to Platable")
  end
end
