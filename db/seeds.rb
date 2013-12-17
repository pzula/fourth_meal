require 'open-uri'

platable = Restaurant.create(name: "Platable", url_slug: "platable", food_type: "American", status: "approved")

plates = Category.create(name: "Plates")
snacks = Category.create(name: "Snacks")
desserts = Category.create(name: "Dessert")
soups = Category.create(name: "Soups")
salads = Category.create(name: "Salads")
sandwiches = Category.create(name: "Sandwiches")
burgers = Category.create(name: "Burgers")
brunch = Category.create(name: "Brunch")

platable_id = Restaurant.find_by(url_slug: "platable").id
deviled_eggs_params = {title: "Deviled Eggs", description: "12 delicious deviled eggs", price: '5', restaurant_id: platable_id}
deviled_eggs = Item.new(deviled_eggs_params)
deviled_eggs.image = open("https://platable.s3.amazonaws.com/items/images/000/000/001/small/deviled_eggs.jpg")
deviled_eggs.save

snacks.items << deviled_eggs
plates.items << deviled_eggs

mac_and_cheese = Item.new(title: "Interstate Mac and Cheese", description: "Creamy Mac and Cheese", price: '5', restaurant_id: platable_id)
mac_and_cheese.image = open("https://platable.s3.amazonaws.com/items/images/000/000/002/small/mac_and_cheese.jpg")
mac_and_cheese.save

snacks.items << mac_and_cheese

spoon_bread = Item.new(title: "Spoon Bread", description: "Warm bread with butter, honey, and bacon", price: '7', restaurant_id: platable_id)
spoon_bread.image = open("https://platable.s3.amazonaws.com/items/images/000/000/003/small/spoon_bread1.jpg")
spoon_bread.save

snacks.items << spoon_bread

tomato_soup = Item.new(title: "Tomato Soup", description: "Roasted tomato soup with oozy grilled cheese", price: '6', restaurant_id: platable_id)
tomato_soup.image = open("https://platable.s3.amazonaws.com/items/images/000/000/004/small/tomato_soup.jpg")
tomato_soup.save

soups.items << tomato_soup

green_bean_salad = Item.new(title: "Green Bean Salad", description: "Fresh green beans with goat cheese and pecans", price: '8', restaurant_id: platable_id)
green_bean_salad.image = open("https://platable.s3.amazonaws.com/items/images/000/000/005/small/green_beans.jpg")
green_bean_salad.save

salads.items << green_bean_salad

arugula_salad = Item.new(title: "Arugula Salad", description: "Arugula, radish, and sunflower seeds with a zesty lemon vinaigrette", price: '7', restaurant_id: platable_id)
arugula_salad.image = open("https://platable.s3.amazonaws.com/items/images/000/000/006/small/arugula_salad.jpg")
arugula_salad.save

salads.items << arugula_salad

cubano_sandwich = Item.new(title: "Cubano Sandwich", description: "Classic cubano sandwich with house-made pickles, mustard, and black beans with rice", price: '9', restaurant_id: platable_id)
cubano_sandwich.image = open("https://platable.s3.amazonaws.com/items/images/000/000/007/small/cubano_sandwich.jpg")
cubano_sandwich.save

sandwiches.items << cubano_sandwich

monte_cristo = Item.new(title: "Monte Cristo Sandwich", description: "Classic Monte Cristo served with shoestring potatoes", price: '9', restaurant_id: platable_id)
monte_cristo.image = open("https://platable.s3.amazonaws.com/items/images/000/000/008/small/monte_cristo.jpg")
monte_cristo.save

sandwiches.items << monte_cristo

classic_burger = Item.new(title: "Classic Burger", description: "Burger and fries with your choice of swiss, cheddar, muenster, or provolone", price: '10', restaurant_id: platable_id)
classic_burger.image = open("https://platable.s3.amazonaws.com/items/images/000/000/009/small/classic_burger.jpg")
classic_burger.save

burgers.items << classic_burger

veggie_burger = Item.new(title: "House Made Veggie Burger", description: "Burger and fries with your choice of swiss, cheddar, muenster, or provolone", price: '10', restaurant_id: platable_id)
veggie_burger.image = open("https://platable.s3.amazonaws.com/items/images/000/000/010/small/veggie_burger.jpg")
veggie_burger.save

burgers.items << veggie_burger

chicken_fried_chicken = Item.new(title: "Chicken Fried Chicken", description: "Chicken fried chicken, pork belly green beans & country gravy", price: '15', restaurant_id: platable_id)
chicken_fried_chicken.image = open("https://platable.s3.amazonaws.com/items/images/000/000/011/small/chicken_fried_chicken.jpg")
chicken_fried_chicken.save

plates.items << chicken_fried_chicken

seared_ribeye = Item.new(title: "Seared Ribeye", description: "Served with marinated roasted mushrooms", price: '18', restaurant_id: platable_id)
seared_ribeye.image = open("https://platable.s3.amazonaws.com/items/images/000/000/012/small/seared_ribeye.jpg")
seared_ribeye.save

plates.items << seared_ribeye

tacos = Item.new(title: "New Mexican Veggie Street Tacos", description: "Accompanied by smoked mushrooms and roasted squash", price: '19', restaurant_id: platable_id)
tacos.image = open("https://platable.s3.amazonaws.com/items/images/000/000/013/small/tacos.jpg")
tacos.save

plates.items << tacos

pork = Item.new(title: "Confit of Pork Porterhouse", description: "Served over a bed of polenta with braised greens", price: '16', restaurant_id: platable_id)
pork.image = open("https://platable.s3.amazonaws.com/items/images/000/000/014/small/pork.jpg")
pork.save

plates.items << pork

grapefruit = Item.new(title: "Sugar Broiled Half Grapefruit", description: "Half a grapefruit topped with dark brown sugar and broiled until crisp", price: '4', restaurant_id: platable_id)
grapefruit.image = open("https://platable.s3.amazonaws.com/items/images/000/000/015/small/grapefruit.jpg")
grapefruit.save

snacks.items << grapefruit
brunch.items << grapefruit

coffee_cake = Item.new(title: "Coffee Cake", description: "Walnut and brown sugar crumble coffee cake", price: '4', restaurant_id: platable_id)
coffee_cake.image = open("https://platable.s3.amazonaws.com/items/images/000/000/016/small/coffee_cake.jpg")
coffee_cake.save

snacks.items << coffee_cake

hoecakes = Item.new(title: "Sweet Corn Hoecake Platter", description: "Sweet corn hoecake, pulled pork, fried egg, house-made cheese curds, and hash",  price: '10', restaurant_id: platable_id)
hoecakes.image = open("https://platable.s3.amazonaws.com/items/images/000/000/017/small/hoecakes.jpg")
hoecakes.save

brunch.items << hoecakes
plates.items << hoecakes

french_toast = Item.new(title: "French Toast", description: "Topped with brûléed bananas, whipped cream, and maple syrup",  price: '8', restaurant_id: platable_id)
french_toast.image = open("https://platable.s3.amazonaws.com/items/images/000/000/018/small/french_toast.jpg")
french_toast.save

brunch.items << french_toast
plates.items << french_toast

omelette = Item.new(title: "Freakin’ Denver Omelette", description: "Served with hash and toast",  price: '8', restaurant_id: platable_id)
omelette.image = open("https://platable.s3.amazonaws.com/items/images/000/000/019/small/denver_omelette.jpg")
omelette.save

brunch.items << omelette
plates.items << omelette

trifle = Item.new(title: "Pecan & Mixed Berry Trifle", description: "Pecan and mixed berry trifle topped with whipped cream", price: '7', restaurant_id: platable_id)
trifle.image = open("https://platable.s3.amazonaws.com/items/images/000/000/020/small/trifle.jpg")
trifle.save

desserts.items << trifle

smores = Item.new(title: "Interstate S'Mores", description: "Graham crackers, marshmallows, and chocolate", price: '7', restaurant_id: platable_id)
smores.image = open("https://platable.s3.amazonaws.com/items/images/000/000/021/small/s'mores.jpg")
smores.save

desserts.items << smores

coco_cake = Item.new(title: "Coconut Cream Cheese Ice Box Cake", description: "Heaven on a plate", price: '7', restaurant_id: platable_id)
coco_cake.image = open("https://platable.s3.amazonaws.com/items/images/000/000/022/small/coco_cake.jpg")
coco_cake.save

desserts.items << coco_cake

usr = User.new({username: 'meekaetal', email: 'meekaetal@gmail.com', password: 'password'})
usr.admin = true
usr.save

User.create({username: 'bob', email: 'bob@example.com', password: 'password'})

ono_burrito = Restaurant.create(name: "Ono Burrito", url_slug: "ono-burrito", food_type: "Mexican", status: "approved")

ono_burrito_id = Restaurant.find_by(url_slug:"ono-burrito").id

entrees = Category.create(name: "Entrees")
combos = Category.create(name: "Combos")
kids = Category.create(name: "Kids Menu")
add_ons = Category.create(name: "Add Ons")
beverages = Category.create(name: "Beverages")
appetizers = Category.create(name: "Appetizers")
salads = Category.create(name: "Salads")
burritos = Category.create(name: "Burritos")
tacos = Category.create(name: "Tacos")
nachos = Category.create(name: "Nachos")

mega_tacos = Item.new(title: "New Mexican Veggie Street Tacos", description: "Accompanied by smoked mushrooms and roasted squash", price: '19', restaurant_id: ono_burrito_id)
mega_tacos.image = open("https://platable.s3.amazonaws.com/items/images/000/000/013/small/tacos.jpg")
mega_tacos.save

entrees.items << mega_tacos
tacos.items << mega_tacos

mega_burritos = Item.new(title: "THE Ono Burrito", description: "A mouthwatering slab of meat in white flour", price: '19', restaurant_id: ono_burrito_id)
mega_burritos.image = open("https://platable.s3.amazonaws.com/items/images/000/000/013/small/tacos.jpg")
mega_burritos.save

entrees.items << mega_burritos
burritos.items << mega_burritos

margaritas = Item.new(title: "Margaritas", description: "Blended margs for your enjoyment", price: '12', restaurant_id: ono_burrito_id)
margaritas.image = open("https://platable.s3.amazonaws.com/items/images/000/000/013/small/tacos.jpg")
margaritas.save

beverages.items << margaritas

soda = Item.new(title: "Soda", description: "Sodeeee pop!", price: '7', restaurant_id: ono_burrito_id)
soda.image = open("https://platable.s3.amazonaws.com/items/images/000/000/013/small/tacos.jpg")
soda.save

beverages.items << soda

beer = Item.new(title: "Beer", description: "Fermented and Delicious", price: '8', restaurant_id: ono_burrito_id)
beer.image = open("https://platable.s3.amazonaws.com/items/images/000/000/013/small/tacos.jpg")
beer.save

beverages.items << beer

chips_and_dip = Item.new(title: "Cheese and dippers", description: "YUMMY", price: '4', restaurant_id: ono_burrito_id)
chips_and_dip.image = open("https://platable.s3.amazonaws.com/items/images/000/000/013/small/tacos.jpg")
chips_and_dip.save

appetizers.items << chips_and_dip
kids.items << chips_and_dip
add_ons.items << chips_and_dip

mega_nachos = Item.new(title: "Three Cheese Nachos", description: "Thats 'not-cho' cheese", price: '25', restaurant_id: ono_burrito_id)
mega_nachos.image = open("https://platable.s3.amazonaws.com/items/images/000/000/013/small/tacos.jpg")
mega_nachos.save

appetizers.items << mega_nachos
nachos.items << mega_nachos
kids.items << mega_nachos

two_naked_tacos = Item.new(title: "Two Naked Tacos", description: "Tacos without the wrapping", price: '14', restaurant_id: ono_burrito_id)
two_naked_tacos.image = open("https://platable.s3.amazonaws.com/items/images/000/000/013/small/tacos.jpg")
two_naked_tacos.save

appetizers.items << two_naked_tacos
tacos.items << two_naked_tacos

tacos_with_gumbo_soup = Item.new(title: "Tacos and Soup", description: "You must be hungry!!", price: '7', restaurant_id: ono_burrito_id)
tacos_with_gumbo_soup.image = open("https://platable.s3.amazonaws.com/items/images/000/000/013/small/tacos.jpg")
tacos_with_gumbo_soup.save

tacos.items << tacos_with_gumbo_soup
entrees.items << tacos_with_gumbo_soup

quesadilla = Item.new(title: "Cheesy quesadilla", description: "CHEEZY!!!", price: '9', restaurant_id: ono_burrito_id)
quesadilla.image = open("https://platable.s3.amazonaws.com/items/images/000/000/013/small/tacos.jpg")
quesadilla.save

salads.items << quesadilla
entrees.items << quesadilla
##################################################################################################


# The data:
# At least 10,000 restaurants
# Broken into 30 regions
# At least 20 items per restaurant
# At least 3 categories per restaurant
# 100,000 users
# 2 restaurant admins per restaurant
# 2 stockers per restaurant
# 2 platform administrators

####Regions######   

 # denver = Location.create(city: "Denver")
 #  dc = Location.create(city: "Washington, D.C.")
 #  nyc = Location.create(city: "New York City")
 #  atlanta = Location.create(city: "Atlanta")
 #  philadelphia = Location.create(city: "Philadelphia")

 #  pittsburgh = Location.create(city: "Pittsburgh")
 #  boston = Location.create(city: "Boston")
 #  durham = Location.create(city: "Durham")
 #  orlando = Location.create(city: "Orlando")
 #  burlington = Location.create(city: "Burlington")

 #  fargo = Location.create(city: "Fargo")
 #  minneapolis = Location.create(city: "Minneapolis")
 #  chicago = Location.create(city: "Chicago")
 #  madison = Location.create(city: "Madison")
 #  cincinnati = Location.create(city: "Cincinatti")

 #  albuquerque = Location.create(city: "Albuquerque")
 #  santa_fe = Location.create(city: "Santa Fe")
 #  colorado_springs = Location.create(city: "Colorado Springs")
 #  boulder = Location.create(city: "Boulder")
 #  slc = Location.create(city: "Salt Lake City")

 #  austin = Location.create(city: "Austin")
 #  dallas = Location.create(city: "Dallas")
 #  seattle = Location.create(city: "Seattle")
 #  portland = Location.create(city: "Portland")
 #  la = Location.create(city: "Los Angeles")

 #  sf = Location.create(city: "San Francisco")
 #  san_diego = Location.create(city: "San Diego")
 #  honolulu = Location.create(city: "Honolulu")
 #  anchorage = Location.create(city: "Anchorage")
 #  detroit = Location.create(city: "Detriot")

 #  cities = [denver, dc, nyc, atlanta, philadelphia,
 #            pittsburgh, boston, durham, orlando, burlington,
 #            fargo, minneapolis, chicago, madison, cincinnati,
 #            albuquerque, santa_fe, colorado_springs, boulder, slc,
 #            austin, dallas, seattle, portland, la,
 #            sf, san_diego, honolulu, anchorage, detroit]



# RESTAURANTS

#approved
# ono = Restaurant.create(name: "Ono Burrito", url_slug: "ono-burrito", status: "approved", food_type: "mexican")
# rd = RestaurantDetail.create(description: "Burritos YA'LL", restaurant_id: ono.id)
# platable = Restaurant.create(name: "Platable", url_slug: "platable", status: "approved", food_type: "American")
#pt = RestaurantDetail.create(description: "This is america!", restaurant_id: platable.id )
# pho = Restaurant.create(name: "WT Pho", url_slug: "wtpho", status: "approved", food_type: asian)
# ph= RestaurantDetail.create(description: "Knewdles", restaurant_id: pho.id)
# meeka = Restaurant.create(name: "Meekas Menagerie", url_slug: "meekseats", status: "approved", food_type: "vegan")
# mk = RestaurantDetail.create(description: "We cuddle 'em, we don't eat 'em!", restaurant_id: meeka.id)
# persa = Restaurant.create(name: "Persa's Farm Treats", url_slug: "zulaeats", status: "approved", food_type: "organic")
# pz = RestaurantDetail.create(description: "I grew this and butchered it, now eat it!", restaurant_id: persa.id)
# teapane = Restaurant.create(name: "Teapanes house of Tea PAIN", url_slug: "teapanz", status: "approved", food_type: "beverages")
# tp = RestaurantDetail.create(description: "Teapanes house of Tea...PAIN!", restaurant_id: teapane.id)
#pending
#dpz = Restaurant.create(name: "Denver Pizza CO", url_slug: "dpc", food_type: "pizza")
#dpz = RestaurantDetail.create(description: " GLUTEN!", restaurant_id: dpz.id)
#colt_and_gray = Restaurant.create(name: "Colt and Gray", url_slug: "CandG", food_type: "american")
#cg = RestaurantDetail.create(description: "All the tasty parts", restaurants_id: colt_and_gray.id )

#restaurants = [ono, platable, pho, meeka, persa, dpz, teapane, coltandgray]

  # def random_hour(from, to)
  #   (Date.today + rand(from..to).hour + rand(0..60).minutes).to_datetime
  # end

 #days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

    #def restaurant_hours(rest)
      # days.each do |day|
      #   h = Hours.new
      #   h.restaurant_id = rest.id
      #   h.day = day 
      #   start_at = random_hour(4, 10)
      #   end_at = random_hour(11, 24)
      #   h.save
        #end
      #end

    #restaurants.each do |rest|
      #restaurant_hours(rest)
    #end


  # def clone_restaurant(restaurant, locations, count)
  #   count.times do |i|
  #     puts "creating restaurant #{restaurant.name} #{i}..."
  #     r = restaurant.dup
  #     r.update(
  #       name: restaurant.name + "#{i}",
  #       status: restaurant.status,
  #       url_slug: restaurant.url_slug + "#{i}",
  #       location: locations[rand(30)])
  #       restaurant_hours(r)
  #   end
  # end

  # restaurants.each {|r| clone_restaurant(r, cities, 10) }
  #restaurants.each {|r| clone_restaurant(r, cities, 1000) }



# USERS

# frank = User.create(email: "demo+franklin@jumpstartlab.com", 
#   username: "", 
#   password: "password",
#   admin => true)

# jeff = User.create(email: "demo+jeff@jumpstartlab.com", 
#   username: "j3",
#   password: "password",
#   admin => true)

# katrina = User.create(email: "demo+katrina@jumpstartlab.com", 
#   username: "kytrynx", 
#   password: "password",
#   admin => true)

# meeka = User.create(email: "rrgayhart@gmail.com", 
#   username: "meek", 
#   password: "password")

# persa = User.create(email: "pzula@persazula.com",
#   username: "zulinator", 
#   password: "password")

# tyler = User.create(email: "adam.dev89@gmail.com", 
#   display_name: "TeaPane", 
#   password: "password")

# def seed_users(count)
#   count.times do |i|
#     puts "Creating user #{i}"
#     User.create(
#       username: "user_#{i}",
#       email: "user_#{i}@example.com",
#       password: "password",)
#   end
# end

# seed_users(10000)
#seed_users(100)




# RESTAURANT USERS

# def seed_restaurant_users(rest_id, boolean_stocker, boolean_admin,  count)
#   
#   count.times do |i|
#     begin "Seeding #{role} number #{i} for restaurant #{rest_id}..."
#       RestaurantEmployee.create(
#         restaurant_id: rest_id,
#         user_id: User.all[rand(@size)],
#         stocker: boolean_stocker,
#         admin: boolean_admin )
#     rescue
#       puts "Failed to create role! Trying again..."
#       retry
#     end
#   end
# end

# @size = User.all.size

# restaurants.each { |r| seed_restaurant_users(r.id, true, false, 2) }
# restaurants.each { |r| seed_restaurant_users(r.id, false, true, 2) }




# ITEMS

# def seed_items(restaurant, menu, count)
#   count.times do |i|
#     begin
#       puts "Seeding item number #{i} for #{restaurant.name}..."
#       title = menu[rand(5)] + "_#{i}"
#       desc = title + ". It's so good!"
#       item = restaurant.items.create( 
#         title: title,
#         description: desc,
#         price: rand(20) + 1,
#         image_file_name: File.open("app/assets/images/seed/#{rand(10)}.jpg", 'r'),
#         active: true,
#         restaurant_id: restaurant.id)
#     rescue
#       binding.pry
#       puts "Item failed to create! Trying again..."
#       retry
#     end
#   end
# end

# restaurants = [ono, platable, pho, meeka, persa, dpz, teapane, coltandgray]
# ono_menu = ["Taco Gumbo", "Steak Burrito", "Breakfast Burrito", "Taco Salad", "Signature Vegetable Burrito"]
# platable_menu = ["Interstate Mac N Cheese", "Smores", "Chitlins", "Corn Bread", "Spicy Black Bean Burger"]
# pho_menu = ["Pho 20", "Pho 39", "Spring Roll", "Steam Buns", "Coke"]
# persa_menu = ["Leg of Lamb", "Bacon wrapped dates", "Curried Chicken", "Ginger BEER", "French Fries"]
# meeka_menu = ["Cupcakes", "Brownies", "Gin and Tonic", "Tomato Soupd", "BIG SALAD"]
# teapane_menu = ["Foie Gras", "Earl Grey", "Salade Perigourdine", "Braised lamb neck", "Bone Marrow"]
# dpz_menu = ["Pepperoni", "Ham and Pineapple", "Veggy special", "Garden Salad", "Soda Pop"]
# coltandgray_menu = ["Charcuterie", "Daily Pork Special", "Burger", "Manhattan", "Negroni"]

# menu_lookup = { ono => ono_menu, 
#                 platable => platable_menu,
#                 pho => pho_menu,
#                 persa => persa_menu,
#                 meeka => meeka_menu,
#                 tea_pane => teapane_menu,
#                 dpz => dpz_menu,
#                 coltandgray => colt_menu,

# restaurants.each { |rest| seed_items(rest, menu_lookup[rest], 20) }




# CATEGORIES

# cats = ["Entrees", "Appetizers", "Dessert", "Beverages", "Specialties", 
#   "Apéritifs", "Digestifs", "Vegetarian", "Salads", "Kids Menu"]

# def seed_categories(restaurant, category_name, count)
#   count.times do |i|
#     begin
#       puts "Creating category #{i} for #{restaurant.name}..."
#       restaurant.categories.create(name: category_name,
#                                   restaurant_id: restaurant.id)
#     rescue
#       binding.pry
#       puts "Category already exists! Trying again..."
#       retry
#     end
#   end 
# end

# restaurants.each { |rest| seed_categories(rest, cats[rand(10)], 5) }




# ITEM CATEGORIES

# def seed_item_categories(restaurant, count)
#   count.times do |i|
#     begin
#       puts "Seeding item category ##{i} for #{restaurant.name}..."
#       item_id = restaurant.items[i].id
#       category_id = restaurant.categories[rand(5)].id
#       ItemCategory.create!( item_id: item_id,
#                             category_id: category_id)
#     rescue
#       puts "Item category failed to create! Trying again..."
#       retry
#     end
#   end
# end

# restaurants.each { |rest| seed_item_categories(rest, 20) }

