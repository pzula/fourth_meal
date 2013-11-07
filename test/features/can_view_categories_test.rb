require "./test/test_helper"

class CanViewCategoriesTest < Capybara::Rails::TestCase

  test "can see all items by category" do
    category = Category.create(name: "brunch")
    item = Item.create(title: 'Deviled Eggs', description: '12 luscious eggs', price: '1')
    category.items << item

    visit root_path
    assert_content page, "Deviled Eggs"
    assert_content page, "brunch"
  end

end
