require "./test/test_helper"

class UserCheckoutTest < Capybara::Rails::TestCase
  test "user must login before checking out" do
    Item.create(title: 'Deviled Eggs', description: '12 luscious eggs', price: '1')
    visit root_path

    within("#item_1") do
      click_on 'Add to Order'
    end

    click_on "My Order"

    click_on "Checkout"

    within("h1") do
      assert_content page, "Login"
    end
  end

  test "user can visit checkout after logging in" do
    User.create({username: 'bob_bob', password: 'password'})
    Item.create(title: 'Deviled Eggs', description: '12 luscious eggs', price: '1')
    visit root_path
    within("#item_1") do
      click_on 'Add to Order'
    end
    click_on "Login"

    fill_in "Username", with: 'bob_bob'
    fill_in "Password", with: 'password'
    click_button "Login"

    visit root_path

    click_on "My Order"
    click_on "Checkout"

    within("#user_order") do
      assert_content page, "Order for bob_bob"
      assert_content page, "Deviled Eggs"
    end

    within("#user_order") do
      click_on "Place Order"
    end

    assert_content page, "Your order is successfull"

    within("#recent_orders") do
      assert_content page, "Deviled Eggs"
    end

    visit items_path
    click_on "My Order"
    assert_content page, "Your Cart is Empty"
  end

  test "user can see all old orders" do
    User.create({username: 'bob_bob', password: 'password'})
    Item.create(title: 'Deviled Eggs', description: '12 luscious eggs', price: 1)
    Item.create(title: 'Spam', description: 'Almost meat', price: 2)

    visit root_path
    within("#item_1") do
      click_on 'Add to Order'
    end
    click_on "Login"

    fill_in "Username", with: 'bob_bob'
    fill_in "Password", with: 'password'
    click_button "Login"

    visit root_path

    click_on "My Order"
    click_on "Checkout"
    click_on "Place Order"

    visit root_path
    within("#item_2") do
      click_on 'Add to Order'
    end

    click_on "My Order"
    click_on "Checkout"
    click_on "Place Order"

    within("#recent_orders") do
      assert_content page, "Deviled Eggs"
      assert_content page, "Spam"
    end

  end

end
