require "./test/test_helper"

class CanAccessItemsTest < Capybara::Rails::TestCase
  test "can see all items" do
    item = Item.new(title: 'Deviled Eggs', description: '12 luscious eggs')
    item.save
    visit root_path
    assert_content page, "Deviled Eggs"
    refute_content page, "Bread"
  end
end
