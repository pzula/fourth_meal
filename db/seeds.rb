# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

plates = Category.create(name: "Plates")
snacks = Category.create(name: "Snacks")
desserts = Category.create(name: "Dessert")
soups = Category.create(name: "Soups")
salads = Category.create(name: "Salads")
sandwiches = Category.create(name: "Sandwiches")
burgers = Category.create(name: "Burgers")
brunch = Category.create(name: "Brunch")

deviled_eggs = Item.new(title: "Deviled Eggs", description: "12 luscious eggs", price: '5')
deviled_eggs.image = File.open("app/assets/images/deviled_eggs.jpg")
deviled_eggs.save

snacks.items << deviled_eggs
plates.items << deviled_eggs

mac_and_cheese = Item.new(title: "Interstate Mac and Cheese", description: "Creamy Mac and Cheese", price: '5')
mac_and_cheese.image = File.open("app/assets/images/mac_and_cheese.jpg")
mac_and_cheese.save

snacks.items << mac_and_cheese

spoon_bread = Item.new(title: "Spoon Bread", description: "Warm Bread with Butter, Honey, and Bacon", price: '7')
spoon_bread.image = File.open("app/assets/images/spoon_bread1.jpg")
spoon_bread.save

snacks.items << spoon_bread

tomato_soup = Item.new(title: "Tomato Soup", description: "Roasted Tomato Soup with Oozy Grilled Cheese", price: '6')
tomato_soup.image = File.open("app/assets/images/tomato_soup.jpg")
tomato_soup.save

soups.items << tomato_soup

green_bean_salad = Item.new(title: "Green Bean Salad", description: "Fresh Green Beans With Pecans and Grapes", price: '8')
green_bean_salad.image = File.open("app/assets/images/green_beans.jpg")
green_bean_salad.save

salads.items << green_bean_salad

arugula_salad = Item.new(title: "Argula Salad", description: "Arugula, Radish, and Sunflower Seeds with a Zesty Lemon Vinaigrette", price: '7')
arugula_salad.image = File.open("app/assets/images/arugula_salad.jpg")
arugula_salad.save

salads.items << arugula_salad

cubano_sandwich = Item.new(title: "Cubano Sandwich", description: "Classic Cubano Sandwich with House-Made Pickles, Mustard, and Black Beans with Rice", price: '9')
cubano_sandwich.image = File.open("app/assets/images/cubano_sandwich.jpg")
cubano_sandwich.save

sandwiches.items << cubano_sandwich

monte_cristo = Item.new(title: "Monte Cristo Sandwich", description: "Served with Shoestring Potatoes", price: '9')
monte_cristo.image = File.open("app/assets/images/monte_cristo.jpg")
monte_cristo.save

sandwiches.items << monte_cristo

classic_burger = Item.new(title: "Classic Burger", description: "Burger and fries with your choice of swiss, cheddar, muenster, or provolone", price: '10')
classic_burger.image = File.open("app/assets/images/classic_burger.jpg")
classic_burger.save

burgers.items << classic_burger

veggie_burger = Item.new(title: "House Made Veggie Burger", description: "Burger and fries with your choice of swiss, cheddar, muenster, or provolone", price: '10')
veggie_burger.image = File.open("app/assets/images/veggie_burger.jpg")
veggie_burger.save

burgers.items << veggie_burger

chicken_fried_chicken = Item.new(title: "Chicken Fried Chicken", description: "Chicken fried chicken, pork belly green beans & country gravy", price: '15')
chicken_fried_chicken.image = File.open("app/assets/images/chicken_fried_chicken.jpg")
chicken_fried_chicken.save

plates.items << chicken_fried_chicken

seared_ribeye = Item.new(title: "Seared Ribeye", description: "Served with Blue Cheese Potato Salad & Whiskey Molasses Sauce", price: '18')
seared_ribeye.image = File.open("app/assets/images/seared_ribeye.jpg")
seared_ribeye.save

plates.items << seared_ribeye

tacos = Item.new(title: "New Mexican Veggie Street Tacos", description: "Accompanied by Smoked Mushrooms, Roasted Squash & Queso Fresco", price: '19')
tacos.image = File.open("app/assets/images/tacos.jpg")
tacos.save

plates.items << tacos

pork = Item.new(title: "Confit of Pork Porterhouse", description: "Served over a bed of Polenta with Braised Greens", price: '16')
pork.image = File.open("app/assets/images/pork.jpg")
pork.save

plates.items << pork

grapefruit = Item.new(title: "Sugar Broiled Half Grapefruit", description: "Half a Grapefruit Topped with Dark Brown Sugar and Broiled Until Crisp", price: '4')
grapefruit.image = File.open("app/assets/images/grapefruit.jpg")
grapefruit.save

snacks.items << grapefruit
brunch.items << grapefruit

coffee_cake = Item.new(title: "Coffee Cake", description: "Walnut, Brown Sugar Crumble Coffee Cake", price: '4')
coffee_cake.image = File.open("app/assets/images/coffee_cake.jpg")
coffee_cake.save

snacks.items << coffee_cake

hoecakes = Item.new(title: "Sweet Corn Hoecake Platter", description: "Sweet corn Hoecake, Pulled Pork, Fried Egg, House-Made Cheese Curd & Hash",  price: '10')
hoecakes.image = File.open("app/assets/images/hoecakes.jpg")
hoecakes.save

brunch.items << hoecakes
plates.items << hoecakes

french_toast = Item.new(title: "French Toast", description: "Topped with Brûléed Banana, Whipped Cream & Maple Syrup",  price: '8')
french_toast.image = File.open("app/assets/images/french_toast.jpg")
french_toast.save

brunch.items << french_toast
plates.items << french_toast

omelette = Item.new(title: "Freakin’ Denver Omelette", description: "Served with Hash & Toast",  price: '8')
omelette.image = File.open("app/assets/images/denver_omelette.jpg")
omelette.save

brunch.items << omelette
plates.items << omelette

trifle = Item.new(title: "Pecan & Mixed Berry Trifle", description: "Pecan & Mixed Berry Trifle Topped with Whipped Cream", price: '7')
trifle.image = File.open("app/assets/images/trifle.jpg")
trifle.save

desserts.items << trifle

smores = Item.new(title: "Interstate S'Mores", description: "Graham Crackers, Marshmallows, and Chocolate", price: '7')
smores.image = File.open("app/assets/images/s'mores.jpg")
smores.save

desserts.items << smores

coco_cake = Item.new(title: "Coconut Cream Cheese Ice Box Cake", description: "Heaven on a Plate", price: '7')
coco_cake.image = File.open("app/assets/images/coco_cake.jpg")
coco_cake.save

desserts.items << coco_cake

usr = User.new({username: 'wvmitchell', password: 'password'})
usr.admin = true
usr.save

User.create({username: 'bob', password: 'password'})

