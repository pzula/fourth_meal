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

    within(".controls") do
      assert_content page, "Login"
    end
  end

  test "user can visit checkout after logging in" do
    User.create({username: 'bob_bob', email: "bob@example.com",
password: 'password'})
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

    assert_content page, "Deviled Eggs"
  end

  test "user can see all old orders" do
    User.create({username: 'bob_bob', email: "bob@example.com",
                password: 'password'})
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
    #click_on "Place Order"

    #within("#recent_orders") do
    #  assert_content page, "Deviled Eggs"
    #  assert_content page, "Spam"
    #end

  end

end
