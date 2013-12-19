 require 'open-uri'

# The data:
# At least 10,000 restaurants
# Broken into 30 regions
# At least 20 items per restaurant
# At least 3 categories per restaurant
# 100,000 users
# 2 restaurant admins per restaurant
# 2 stockers per restaurant
# 2 platform administrators

###Regions######

#   denver = Location.create(name: "Denver")
#   dc = Location.create(name: "Washington, D.C.")
#   nyc = Location.create(name: "New York City")
#   atlanta = Location.create(name: "Atlanta")
#   philadelphia = Location.create(name: "Philadelphia")

#   pittsburgh = Location.create(name: "Pittsburgh")
#   boston = Location.create(name: "Boston")
#   durham = Location.create(name: "Durham")
#   orlando = Location.create(name: "Orlando")
#   burlington = Location.create(name: "Burlington")

#   fargo = Location.create(name: "Fargo")
#   minneapolis = Location.create(name: "Minneapolis")
#   chicago = Location.create(name: "Chicago")
#   madison = Location.create(name: "Madison")
#   cincinnati = Location.create(name: "Cincinatti")

#   albuquerque = Location.create(name: "Albuquerque")
#   santa_fe = Location.create(name: "Santa Fe")
#   colorado_springs = Location.create(name: "Colorado Springs")
#   boulder = Location.create(name: "Boulder")
#   slc = Location.create(name: "Salt Lake City")

#   austin = Location.create(name: "Austin")
#   dallas = Location.create(name: "Dallas")
#   seattle = Location.create(name: "Seattle")
#   portland = Location.create(name: "Portland")
#   la = Location.create(name: "Los Angeles")

#   sf = Location.create(name: "San Francisco")
#   san_diego = Location.create(name: "San Diego")
#   honolulu = Location.create(name: "Honolulu")
#   anchorage = Location.create(name: "Anchorage")
#   detroit = Location.create(name: "Detriot")

#   cities = [denver, dc, nyc, atlanta, philadelphia,
#             pittsburgh, boston, durham, orlando, burlington,
#             fargo, minneapolis, chicago, madison, cincinnati,
#             albuquerque, santa_fe, colorado_springs, boulder, slc,
#             austin, dallas, seattle, portland, la,
#             sf, san_diego, honolulu, anchorage, detroit]



# #RESTAURANTS

# #approved
# ono = Restaurant.create(name: "Ono Burrito", url_slug: "ono-burrito", status: "approved", food_type: "mexican")
# rd = RestaurantDetail.create(description: "Burritos YA'LL", restaurant_id: ono.id)
# platable = Restaurant.create(name: "Platable", url_slug: "platable", status: "approved", food_type: "american")
# pt = RestaurantDetail.create(description: "This is america!", restaurant_id: platable.id )
# pho = Restaurant.create(name: "WT Pho", url_slug: "wtpho", status: "approved", food_type: "asian")
# ph= RestaurantDetail.create(description: "Knewdles", restaurant_id: pho.id)
# meeka = Restaurant.create(name: "Meekas Menagerie", url_slug: "meekseats", status: "approved", food_type: "vegan")
# mk = RestaurantDetail.create(description: "We cuddle 'em, we don't eat 'em!", restaurant_id: meeka.id)
# persa = Restaurant.create(name: "Persa's Farm Treats", url_slug: "zulaeats", status: "approved", food_type: "organic")
# pz = RestaurantDetail.create(description: "I grew this and butchered it, now eat it!", restaurant_id: persa.id)
# teapane = Restaurant.create(name: "Teapanes house of Tea PAIN", url_slug: "teapanz", status: "approved", food_type: "beverages")
# tp = RestaurantDetail.create(description: "Teapanes house of Tea...PAIN!", restaurant_id: teapane.id)

# #pending
# dpz = Restaurant.create(name: "Denver Pizza CO", url_slug: "dpc", food_type: "pizza")
# dpz.restaurant_employees.create(user_id: 6, admin:true)
# dpzz = RestaurantDetail.create(description: " GLUTEN!", restaurant_id: dpz.id)
# coltandgray = Restaurant.create(name: "Colt and Gray", url_slug: "CandG", food_type: "american")
# coltandgray.restaurant_employees.create(user_id:6, admin: true)
# cg = RestaurantDetail.create(description: "All the tasty parts", restaurant_id: coltandgray.id )

# restaurants = [ono, platable, pho, meeka, persa, dpz, teapane, coltandgray]


#   def random_hour(from, to)
#     (Date.today + rand(from..to).hour + rand(0..60).minutes).to_datetime
#   end

#  @days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

#     def restaurant_hours(rest)
#       @days.each do |day|
#         h = Hours.new
#         h.restaurant_id = rest.id
#         h.day = day
#         start_at = random_hour(4, 10)
#         end_at = random_hour(11, 24)
#         h.save
#         end
#       end

#     def random_closings
#       1000.times do
#         hour = Hours.find(rand(1..5000))
#         hour.closed = true
#         hour.save
#       end
#     end



#   def clone_restaurant(restaurant, locations, count)
#     count.times do |i|
#       puts "creating restaurant #{restaurant.name} #{i}..."
#       r = restaurant.dup
#       r.update(
#         name: restaurant.name + "#{i}",
#         status: restaurant.status,
#         url_slug: restaurant.url_slug + "#{i}",
#         location: locations[rand(30)])
#         restaurant_hours(r)
#     end
#   end

#   restaurants.each {|r| clone_restaurant(r, cities, 1000) }
#   restaurants.each {|r| clone_restaurant(r, cities, 10) }

#   restaurants.each do |rest|
#       restaurant_hours(rest)
#       random_closings
#   end


#USERS

frank = User.create(email: "demo+franklin@jumpstartlab.com",
  username: "",
  password: "password",
  :admin => true)

jeff = User.create(email: "demo+jeff@jumpstartlab.com",
  username: "j3",
  password: "password",
  :admin => true)

katrina = User.create(email: "demo+katrina@jumpstartlab.com",
  username: "kytrinyx",
  password: "password",
  :admin => true)

meeks = User.create(email: "rrgayhart@gmail.com",
  username: "meek",
  password: "password")

zula = User.create(email: "pzula@persazula.com",
  username: "zulinator",
  password: "password")

tyler = User.create(email: "tyler.long@gmail.com",
  username: "TeaPane",
  password: "password")

def seed_users(count)
  count.times do |i|
    puts "Creating user #{i}"
    User.create(
      username: "user_#{i}",
      email: "user_#{i}@example.com",
      password: "password")
  end
end

#seed_users(100000)


#RESTAURANT USERS
@size = User.all.size

def seed_restaurant_users(rest_id, boolean_stocker, boolean_admin, users)

  users.each do |user|
    puts "Seeding #{user.inspect} for restaurant #{rest_id}..."
    RestaurantEmployee.create!(
      restaurant_id: rest_id,
      user_id: user.id,
      stocker: boolean_stocker,
      admin: boolean_admin )
   end
end

users = User.limit(10)
@rest_size = Restaurant.limit(10)
# @rest_size.times { |r| seed_restaurant_users(r, true, false, [users.sample, users.sample]) }
@rest_size.times { |r| seed_restaurant_users(r, false, true, [users.sample, users.sample]) }





#ITEMS

db_restaurants = Restaurant.all

  @pictures = ["https://platable.s3.amazonaws.com/craveyard/arugala-salad.png",
    "https://platable.s3.amazonaws.com/craveyard/berry-trifle.png",
    "https://platable.s3.amazonaws.com/craveyard/chicken-fried-chicken.jpeg",
    "https://platable.s3.amazonaws.com/craveyard/classic-burger.png",
    "https://platable.s3.amazonaws.com/craveyard/coffee-cake.png",
    "https://platable.s3.amazonaws.com/craveyard/french-omlettes.png",
    "https://platable.s3.amazonaws.com/craveyard/french-toast.png",
    "https://platable.s3.amazonaws.com/craveyard/half-grapefruit.jpeg",
    "https://platable.s3.amazonaws.com/craveyard/hoe-platter.png",
    "https://platable.s3.amazonaws.com/craveyard/house-made-veggie-burger.png",
    "https://platable.s3.amazonaws.com/craveyard/ice-box-cake.png",
    "https://platable.s3.amazonaws.com/craveyard/monte-cristo.png",
    "https://platable.s3.amazonaws.com/craveyard/porterhouse.jpeg",
    "https://platable.s3.amazonaws.com/craveyard/seared-ribeye.png",
    "https://platable.s3.amazonaws.com/craveyard/smores.png",
    "https://platable.s3.amazonaws.com/craveyard/spoon-bread.jpeg",
    "https://platable.s3.amazonaws.com/craveyard/street-tacos.png",
    "https://platable.s3.amazonaws.com/craveyard/tomato-sauce.jpeg"]

def seed_items(restaurant, menu, count)
  count.times do |i|
    begin
      puts "Seeding item number #{i} for #{restaurant.name}..."
      title = menu[rand(5)] + "_#{i}"
      desc = "#{title} +  It's so good!"
      restaurant_id = restaurant.id
      item = Item.new(
        title: title,
        description: desc,
        price: rand(20) + 1,
        active: true,
        restaurant_id: restaurant_id)
      item.image = open(@pictures.first)
      item.save
      @pictures.rotate!
      puts "#{item.restaurant_id}"
    end
  end
end

ono = Restaurant.find(1)
platable = Restaurant.find(2)
pho = Restaurant.find(3)
meeka = Restaurant.find(4)
persa = Restaurant.find(5)
dpz = Restaurant.find(6)
teapane = Restaurant.find(7)
coltandgray = Restaurant.find(8)

restaurants = [ono, platable, pho, meeka, persa, dpz, teapane, coltandgray]
ono_menu = ["Taco Gumbo", "Steak Burrito", "Breakfast Burrito", "Taco Salad", "Signature Vegetable Burrito"]
platable_menu = ["Interstate Mac N Cheese", "Smores", "Chitlins", "Corn Bread", "Spicy Black Bean Burger"]
pho_menu = ["Pho 20", "Pho 39", "Spring Roll", "Steam Buns", "Coke"]
persa_menu = ["Leg of Lamb", "Bacon wrapped dates", "Curried Chicken", "Ginger BEER", "French Fries"]
meeka_menu = ["Cupcakes", "Brownies", "Gin and Tonic", "Tomato Soupd", "BIG SALAD"]
teapane_menu = ["Foie Gras", "Earl Grey", "Salade Perigourdine", "Braised lamb neck", "Bone Marrow"]
dpz_menu = ["Pepperoni", "Ham and Pineapple", "Veggy special", "Garden Salad", "Soda Pop"]
coltandgray_menu = ["Charcuterie", "Daily Pork Special", "Burger", "Manhattan", "Negroni"]

menu_lookup = { ono => ono_menu,
                platable => platable_menu,
                pho => pho_menu,
                persa => persa_menu,
                meeka => meeka_menu,
                teapane => teapane_menu,
                dpz => dpz_menu,
                coltandgray => coltandgray_menu}

 menu_lookup = [ono_menu, platable_menu, pho_menu, persa_menu, meeka_menu, teapane_menu, dpz_menu, coltandgray_menu]

db_restaurants.each do |rest|
  menu = menu_lookup.first
    menu_lookup.rotate!
    seed_items(rest, menu, 5)
  end





#CATEGORIES

cats = ["Entrees", "Appetizers", "Dessert", "Beverages", "Specialties",
  "Apéritifs", "Digestifs", "Vegetarian", "Salads", "Kids Menu"]

def seed_categories(restaurant, category_name, count)
  count.times do |i|
      puts "Creating category #{i} for #{restaurant.name}..."
      Category.create(name: category_name)
                                  #restaurant_id: restaurant.id)
  end
end

rest_size = Restaurant.limit(10)
rest_size.each { |rest| seed_categories(rest, cats[rand(9)], 3) }


def seed_item_categories(restaurant, count)
  count.times do |i|
      puts "Seeding item category #{i} for #{restaurant.name}..."
      item = restaurant.items.to_a[i]
      item_id = item.id
      category_id = Category.find_by_id(i + 1)
      ItemCategory.create!( item_id: item_id,
                            category_id: i + 1)
  end
end

rest_size.each { |rest| seed_item_categories(rest, 2) }

