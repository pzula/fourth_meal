require 'open-uri'

plates = Category.create(name: "Plates")
snacks = Category.create(name: "Snacks")
desserts = Category.create(name: "Dessert")
soups = Category.create(name: "Soups")
salads = Category.create(name: "Salads")
sandwiches = Category.create(name: "Sandwiches")
burgers = Category.create(name: "Burgers")
brunch = Category.create(name: "Brunch")

deviled_eggs = Item.new(title: "Deviled Eggs", description: "12 delicious deviled eggs", price: '5')
deviled_eggs.image = open("https://platable.s3.amazonaws.com/items/images/000/000/001/small/deviled_eggs.jpg")
deviled_eggs.save

snacks.items << deviled_eggs
plates.items << deviled_eggs

mac_and_cheese = Item.new(title: "Interstate Mac and Cheese", description: "Creamy Mac and Cheese", price: '5')
mac_and_cheese.image = open("https://platable.s3.amazonaws.com/items/images/000/000/002/small/mac_and_cheese.jpg")
mac_and_cheese.save

snacks.items << mac_and_cheese

spoon_bread = Item.new(title: "Spoon Bread", description: "Warm bread with butter, honey, and bacon", price: '7')
spoon_bread.image = open("https://platable.s3.amazonaws.com/items/images/000/000/003/small/spoon_bread1.jpg")
spoon_bread.save

snacks.items << spoon_bread

tomato_soup = Item.new(title: "Tomato Soup", description: "Roasted tomato soup with oozy grilled cheese", price: '6')
tomato_soup.image = open("https://platable.s3.amazonaws.com/items/images/000/000/004/small/tomato_soup.jpg")
tomato_soup.save

soups.items << tomato_soup

green_bean_salad = Item.new(title: "Green Bean Salad", description: "Fresh green beans with goat cheese and pecans", price: '8')
green_bean_salad.image = open("https://platable.s3.amazonaws.com/items/images/000/000/005/small/green_beans.jpg")
green_bean_salad.save

salads.items << green_bean_salad

arugula_salad = Item.new(title: "Arugula Salad", description: "Arugula, radish, and sunflower seeds with a zesty lemon vinaigrette", price: '7')
arugula_salad.image = open("https://platable.s3.amazonaws.com/items/images/000/000/006/small/arugula_salad.jpg")
arugula_salad.save

salads.items << arugula_salad

cubano_sandwich = Item.new(title: "Cubano Sandwich", description: "Classic cubano sandwich with house-made pickles, mustard, and black beans with rice", price: '9')
cubano_sandwich.image = open("https://platable.s3.amazonaws.com/items/images/000/000/007/small/cubano_sandwich.jpg")
cubano_sandwich.save

sandwiches.items << cubano_sandwich

monte_cristo = Item.new(title: "Monte Cristo Sandwich", description: "Classic Monte Cristo served with shoestring potatoes", price: '9')
monte_cristo.image = open("https://platable.s3.amazonaws.com/items/images/000/000/008/small/monte_cristo.jpg")
monte_cristo.save

sandwiches.items << monte_cristo

classic_burger = Item.new(title: "Classic Burger", description: "Burger and fries with your choice of swiss, cheddar, muenster, or provolone", price: '10')
classic_burger.image = open("https://platable.s3.amazonaws.com/items/images/000/000/009/small/classic_burger.jpg")
classic_burger.save

burgers.items << classic_burger

veggie_burger = Item.new(title: "House Made Veggie Burger", description: "Burger and fries with your choice of swiss, cheddar, muenster, or provolone", price: '10')
veggie_burger.image = open("https://platable.s3.amazonaws.com/items/images/000/000/010/small/veggie_burger.jpg")
veggie_burger.save

burgers.items << veggie_burger

chicken_fried_chicken = Item.new(title: "Chicken Fried Chicken", description: "Chicken fried chicken, pork belly green beans & country gravy", price: '15')
chicken_fried_chicken.image = open("https://platable.s3.amazonaws.com/items/images/000/000/011/small/chicken_fried_chicken.jpg")
chicken_fried_chicken.save

plates.items << chicken_fried_chicken

seared_ribeye = Item.new(title: "Seared Ribeye", description: "Served with marinated roasted mushrooms", price: '18')
seared_ribeye.image = open("https://platable.s3.amazonaws.com/items/images/000/000/012/small/seared_ribeye.jpg")
seared_ribeye.save

plates.items << seared_ribeye

tacos = Item.new(title: "New Mexican Veggie Street Tacos", description: "Accompanied by smoked mushrooms and roasted squash", price: '19')
tacos.image = open("https://platable.s3.amazonaws.com/items/images/000/000/013/small/tacos.jpg")
tacos.save

plates.items << tacos

pork = Item.new(title: "Confit of Pork Porterhouse", description: "Served over a bed of polenta with braised greens", price: '16')
pork.image = open("https://platable.s3.amazonaws.com/items/images/000/000/014/small/pork.jpg")
pork.save

plates.items << pork

grapefruit = Item.new(title: "Sugar Broiled Half Grapefruit", description: "Half a grapefruit topped with dark brown sugar and broiled until crisp", price: '4')
grapefruit.image = open("https://platable.s3.amazonaws.com/items/images/000/000/015/small/grapefruit.jpg")
grapefruit.save

snacks.items << grapefruit
brunch.items << grapefruit

coffee_cake = Item.new(title: "Coffee Cake", description: "Walnut and brown sugar crumble coffee cake", price: '4')
coffee_cake.image = open("https://platable.s3.amazonaws.com/items/images/000/000/016/small/coffee_cake.jpg")
coffee_cake.save

snacks.items << coffee_cake

hoecakes = Item.new(title: "Sweet Corn Hoecake Platter", description: "Sweet corn hoecake, pulled pork, fried egg, house-made cheese curds, and hash",  price: '10')
hoecakes.image = open("https://platable.s3.amazonaws.com/items/images/000/000/017/small/hoecakes.jpg")
hoecakes.save

brunch.items << hoecakes
plates.items << hoecakes

french_toast = Item.new(title: "French Toast", description: "Topped with brûléed bananas, whipped cream, and maple syrup",  price: '8')
french_toast.image = open("https://platable.s3.amazonaws.com/items/images/000/000/018/small/french_toast.jpg")
french_toast.save

brunch.items << french_toast
plates.items << french_toast

omelette = Item.new(title: "Freakin’ Denver Omelette", description: "Served with hash and toast",  price: '8')
omelette.image = open("https://platable.s3.amazonaws.com/items/images/000/000/019/small/denver_omelette.jpg")
omelette.save

brunch.items << omelette
plates.items << omelette

trifle = Item.new(title: "Pecan & Mixed Berry Trifle", description: "Pecan and mixed berry trifle topped with whipped cream", price: '7')
trifle.image = open("https://platable.s3.amazonaws.com/items/images/000/000/020/small/trifle.jpg")
trifle.save

desserts.items << trifle

smores = Item.new(title: "Interstate S'Mores", description: "Graham crackers, marshmallows, and chocolate", price: '7')
smores.image = open("https://platable.s3.amazonaws.com/items/images/000/000/021/small/s'mores.jpg")
smores.save

desserts.items << smores

coco_cake = Item.new(title: "Coconut Cream Cheese Ice Box Cake", description: "Heaven on a plate", price: '7')
coco_cake.image = open("https://platable.s3.amazonaws.com/items/images/000/000/022/small/coco_cake.jpg")
coco_cake.save

desserts.items << coco_cake

usr = User.new({username: 'wvmitchell', password: 'password'})
usr.admin = true
usr.save

User.create({username: 'bob', password: 'password'})

