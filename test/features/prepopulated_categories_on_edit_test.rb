require "./test/test_helper"

class PrepopulatedCategoriesOnEditTest < Capybara::Rails::TestCase
  test "categories are prepopulated on edit" do
    item = Item.create({title: "Deviled Eggs", description: "one dozen eggs", price: 5})
    category1 = Category.create({name: "Snacks"})
    category2 = Category.create({name: "Lunch"})
    item.categories << category1
    visit edit_item_path(item)
    assert has_checked_field?("item_category_1")
  end

  test "correct categories are prepopulated on edit" do
    item = Item.create({title: "Deviled Eggs", description: "one dozen eggs", price: 5})
    category1 = Category.create({name: "Snacks"})
    category2 = Category.create({name: "Lunch"})
    item.categories << category1
    visit edit_item_path(item)
    assert has_unchecked_field?("item_category_2")
  end
end
