require './test/test_helper'

class CanEditItemCategoryTest < Capybara::Rails::TestCase

  test "can add a category to a new item" do
    Category.create(name: "Plates")
    Category.create(name: "Brunch")
    Category.create(name: "Snacks")
    visit new_item_path
    fill_in "Title", :with => "Chocolate Moouse Cake"
    fill_in "Description", :with => "Delicious double-chocolate cake"
    fill_in "Price", :with => "8"
    find_field('categories').find('option[Dessert]').text
    click_button "submit"
    assert_content page, "Chocolate Moouse Cake"
    assert_content page, "Dessert"
  end

end
