require "./test/test_helper"

class CanAccessItemsTest < Capybara::Rails::TestCase

  test "can see all items" do
    item = Item.new(title: 'Deviled Eggs', description: '12 luscious eggs', price: '1')
    item.save
    visit root_path
    assert_content page, "Deviled Eggs"
    refute_content page, "Bread"
  end

  test "can see item category" do
    category = Category.create(name: "Plates")
    item = Item.create({title: "Burger", description: "Loafy goodness", price: '1'})
    category.items << item
    visit items_path
    assert_content page, "Burger"
    assert_content page, "Plates"
  end


  test "inactive items are not visible" do
    @item = Item.create({title: "Burger", description: "Loafy goodness", price: '1', active: false})
    @item2 = Item.create({title: "Pita", description: "Loafy badness", price:'1', active: true})
    visit items_path
    within("#items") do
      assert_content page, "Loafy badness"
      refute_content page, "Loafy goodness"
    end
  end

  test "can view individual item info" do
    @item = Item.create({title: "Burger", description: "Loafy goodness", price: '1'})
    @item2 = Item.create({title: "Pita", description: "Loafy badness", price:'1'})
    visit items_path
    within("#item_1") do
      click_on "#{@item.title}"
    end
    assert_content page, "$1.00"
    assert_content page, "Burger"
  end

end
