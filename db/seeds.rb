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

deviled_eggs = Item.create({title: "Deviled Eggs", description: "12 luscious eggs", price: '5'})

snacks.items << deviled_eggs
plates.items << deviled_eggs

snacks.items << Item.create({title: "Interstate Mac and Cheese", description: "Creamy Mac and Cheese", price: '5'})

snacks.items << Item.create({title: "Spoon Bread", description: "Warm Bread with Butter, Honey, and Bacon", price: '7'})

soups.items << Item.create({title: "Tomato Soup", description: "Roasted Tomato Soup with Oozy Grilled Cheese", price: '6'})

salads.items << Item.create({title: "Green Bean Salad", description: "Fresh Green Beans With Pecans and Grapes", price: '8'})

salads.items << Item.create({title: "Argula Salad", description: "Arugula, Radish, and Sunflower Seeds with a Zesty Lemon Vinaigrette", price: '7'})

sandwiches.items << Item.create({title: "Cubano Sandwich", description: "Classic Cubano Sandwich with House-Made Pickles, Mustard, and Black Beans with Rice", price: '9'})

sandwiches.items << Item.create({title: "Monte Cristo Sandwich", description: "Served with Shoestring Potatoes", price: '9'})

burgers.items << Item.create({title: "Classic Burger", description: "Burger and fries with your choice of swiss, cheddar, muenster, or provolone", price: '10'})

burgers.items << Item.create({title: "House Made Veggie Burger", description: "Burger and fries with your choice of swiss, cheddar, muenster, or provolone", price: '10'})

plates.items << Item.create({title: "Chicken Fried Chicken", description: "Chicken fried chicken, pork belly green beans & country gravy", price: '15'})

plates.items << Item.create({title: "Seared Ribeye", description: "Served with Blue Cheese Potato Salad & Whiskey Molasses Sauce", price: '18'})

plates.items << Item.create({title: "New Mexican Veggie Street Tacos", description: "Accompanied by Smoked Mushrooms, Roasted Squash & Queso Fresco", price: '19'})

plates.items << Item.create({title: "Confit of Pork Porterhouse", description: "Served With with Brussel Sprouts & House-Made Mustard", price: '16'})

grapefruit = Item.create({title: "Sugar Broiled Half Grapefruit", description: "Half a Grapefruit Topped with Dark Brown Sugar and Broiled Until Crisp", price: '4'})

snacks.items << grapefruit
brunch.items << grapefruit

snacks.items << Item.create({title: "Coffee Cake", description: "Walnut, Brown Sugar Crumble Coffee Cake", price: '4'})

hoecake = Item.create({title: "Sweet Corn Hoecake Platter", description: "Sweet corn Hoecake, Pulled Pork, Fried Egg, House-Made Cheese Curd & Hash",  price: '10'})

brunch.items << hoecake
plates.items << hoecake

french_toast = Item.create({title: "French Toast", description: "Topped with Brûléed Banana, Whipped Cream & Maple Syrup",  price: '8'})

brunch.items << french_toast
plates.items << french_toast

omelette= Item.create({title: "Freakin’ Denver Omelette", description: "Served with Hash & Toast",  price: '8'})

brunch.items << omelette
plates.items << omelette

desserts.items << Item.create({title: "Pecan & Mixed Berry Trifle", description: "Pecan & Mixed Berry Trifle Topped with Whipped Cream", price: '7'})

desserts.items << Item.create({title: "Interstate S'Mores", description: "Graham Crackers, Marshmallows, and Chocolate", price: '7'})

desserts.items << Item.create({title: "Coconut Cream Cheese Ice Box Cake", description: "Heaven on a Plate", price: '7'})

usr = User.new({username: 'wvmitchell', password: 'password'})
usr.admin = true
usr.save

User.create({username: 'bob', password: 'password'})

