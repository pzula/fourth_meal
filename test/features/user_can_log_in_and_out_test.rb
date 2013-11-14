require "./test/test_helper"

class UserCanLogInAndOutTest < Capybara::Rails::TestCase
  test "user can log in and out" do
    user = User.new
    user.username = 'user'
    user.password = 'password'
    user.email = 'user@example.com'
    user.save

    visit root_path

    click_on "Login"

    fill_in "Username", with: 'user'
    fill_in "Password", with: 'password'
    click_button "Login"

    assert_content page, 'Successfully logged in as user'

    click_on "Logout"

    assert_content page, "Logged out"
    refute_content page, "Logout"

  end

end
