class RestaurantMailer < ActionMailer::Base
  default from: "customer_service@craveyard.com"

  def restaurant_created(user, restaurant)
    @user = user
    @url = "http://fourth-meal-group7.herokuapp.com/users/#{user.id}"
    @restaurant = restaurant
    @restaurant_name = @restaurant.name
    mail(to: @user.email, subject: "Craveyard: Your Application to Create #{@restaurant.name}")
  end

  def restaurant_created_admin_notification(restaurant)
    @restaurant = restaurant
    @restaurant_name = @restaurant.name
    @url = "http://fourth-meal-group7.herokuapp.com/dashboard"
    @super_admins = User.where(admin: true)
    @super_admins.each do |admin|
      mail(to: admin.email, subject: "Craveyard: A New Restaurant Application Has Been Submitted")
    end
  end

  def restaurant_approved(user, restaurant)
    @user = user
    @restaurant = restaurant
    @url = "http://fourth-meal-group7.herokuapp.com/restaurants/#{@restaurant.id}"
    @restaurant_name = @restaurant.name
    mail(to: @user.email, subject: "Craveyard: Your Restaurant: #{@restaurant.name} Was Approved!")
  end

  def restaurant_denied(user, restaurant)
    @user = user
    @restaurant = restaurant
    @restaurant_name = @restaurant.name
    mail(to: @user.email, subject: "Craveyard: Your Restaurant: #{@restaurant.name} Was Denied")
  end
end
