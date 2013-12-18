# class RestaurantBuilder

#   @queue = :restaurants

#   def self.perform(name, url_slug, status, food_type, number)
#     r = Restaurant.create(
#         name: name + "#{number}",
#         status: status,
#         url_slug: url_slug + "#{number}")
#         #location: Location.all.sample(30))
#     RestaurantDetail.create(description: "delicious food for all", restaurant_id: r.id)
        

#   end
# end
