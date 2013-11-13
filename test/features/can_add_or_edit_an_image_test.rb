require "./test/test_helper"

class CanAddOrEditAnImageTest < Capybara::Rails::TestCase

  test "can add an image to an item" do
    user1 = User.new({username: 'admin', password: 'password'})
    user1.admin = true
    user1.save

    item = Item.new(title: 'Deviled Eggs', description: '12 luscious eggs', price: '1')
    item.save

    visit root_path
    click_on "Login"

    fill_in "Username", with: 'admin'
    fill_in "Password", with: 'password'
    click_button "Login"

    visit edit_item_path(item.id)
    attach_file("item_image", "./app/assets/images/deviled_eggs.jpg")
    save_and_open_page
    click_button "Update"
  end

end
