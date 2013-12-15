class RestaurantMailer < ActionMailer::Base
  default from: "customer_service@craveyard.com"

  def restaurant_created(user, restaurant)
    @user = user
    @restaurant = restaurant
    @restaurant_name = @restaurant.name
    mail(to: @user.email, subject: "Your Application to Create #{@restaurant.name}")
  end

  def restaurant_created_admin_notification(restaurant)
    @restaurant = restaurant
    @restaurant_name = @restaurant.name
    @super_admins = User.where(admin: true)
    @super_admins.each do |admin|
      mail(to: admin.email, subject: "A New Restaurant Application Has Been Submitted")
    end
  end
end
