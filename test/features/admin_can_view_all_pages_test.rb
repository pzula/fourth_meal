require "./test/test_helper"

class AdminCanViewAllPagesTest < Capybara::Rails::TestCase

  test "admin can view all users" do
    user1 = User.new({username: 'admin', password: 'password'})
    user1.admin = true
    user1.save
    user2 = User.create({username: 'bob_bob', password: 'password'})

    visit root_path
    click_on "Login"

    fill_in "Username", with: 'admin'
    fill_in "Password", with: 'password'
    click_button "Login"

    visit users_path
    assert_content page, 'All users'
  end

  test "admin can view individual users" do
    user1 = User.new({username: 'admin', password: 'password'})
    user1.admin = true
    user1.save
    user2 = User.create({username: 'bob_bob', password: 'password'})

    visit root_path
    click_on "Login"

    fill_in "Username", with: 'admin'
    fill_in "Password", with: 'password'
    click_button "Login"

    visit user_path(user2)
    assert_content page, 'bob_bob'
  end
end
