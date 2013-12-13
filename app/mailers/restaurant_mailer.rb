class RestaurantMailer < ActionMailer::Base
  default from: "customer_service@craveyard.com"

  def restaurant_created(user, restaurant)
    @user = user
    @restaurant = restaurant
    @restaurant_name = @restaurant.name
    mail(to: @user.email, subject: "Your Application to Create #{@restaurant.name}")
  end
end
