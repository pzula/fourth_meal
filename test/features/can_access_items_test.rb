require "./test/test_helper"

class CanAccessItemsTest < Capybara::Rails::TestCase

  test "can see all items" do
    item = Item.new(title: 'Deviled Eggs', description: '12 luscious eggs')
    item.save
    visit root_path
    assert_content page, "Deviled Eggs"
    refute_content page, "Bread"
  end

  test "can create item" do
    visit new_item_path
    fill_in "Title", :with => "deviled eggs"
    fill_in "Description", :with => "12 luscious eggs"
    fill_in "Price", :with => "3"
    click_button "Create item"
    assert_content page, "deviled eggs"
    assert_content page, "12 luscious eggs"
    assert_content page, "3"
  end

end
