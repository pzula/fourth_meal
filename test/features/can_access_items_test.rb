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
    fill_in "Category", :with => "brunch"
    click_button "submit"
    assert_content page, "deviled eggs"
    assert_content page, "12 luscious eggs"
    assert_content page, "3"
    assert_content page, "brunch"
  end

  test "can see item category" do
    Item.create({title: "Burger", description: "Loafy goodness", category: "burger"})
    visit items_path
    assert_content page, "burger"
  end

  test "can edit an item" do
    @item = Item.create({title: "Burger", description: "Loafy goodness", category: "burger"})
    visit edit_item_path(@item)
    fill_in "Description", :with => "Juicy delicious meat"
    click_button "submit"
    assert_content page, "Juicy delicious meat"
    assert_content page, "Burger"
  end

end
