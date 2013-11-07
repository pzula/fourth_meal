require "./test/test_helper"

class RegularUserCannotViewAdminPagesTest < Capybara::Rails::TestCase

  test "logged in user cannot view other user's info" do
    user1 = User.create({username: 'bob_bob', password: 'password'})
    user2 = User.create({username: 'mary_mary', password: 'password'})

    visit root_path
    click_on "Login"

    fill_in "Username", with: 'bob_bob'
    fill_in "Password", with: 'password'
    click_button "Login"

    visit user_path(user2)
    refute_content page, 'mary_mary'
  end

  test "logged in user cannot view listing of all users" do
    user1 = User.new({username: 'admin', password: 'password'})
    user1.admin = true
    user1.save
    user2 = User.create({username: 'bob_bob', password: 'password'})

    visit root_path
    click_on "Login"

    fill_in "Username", with: 'bob_bob'
    fill_in "Password", with: 'password'
    click_button "Login"

    visit users_path
    refute_content page, 'All users'
  end

  test "logged in user cannot edit other users" do
    user1 = User.create({username: 'bob_bob', password: 'password'})
    user2 = User.create({username: 'mary_mary', password: 'password'})

    visit root_path
    click_on "Login"

    fill_in "Username", with: 'bob_bob'
    fill_in "Password", with: 'password'
    click_button "Login"

    visit edit_user_path(user2)
    refute_content page, "Editing user"
  end

  test "logged in user cannot create items" do
    user1 = User.create({username: 'bob_bob', password: 'password'})
end
