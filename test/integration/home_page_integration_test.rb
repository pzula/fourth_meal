require "./test/test_helper"

class HomePageIntegrationTest < Capybara::Rails::TestCase

  test "home page has correct content for Public User" do

    visit static_pages_home_path
    assert_content page, "Sign Up"
    assert_content page, "Sign In"

    assert_content page, "Satisfy Your Craving"
    assert_content page, "Pick a Restaurant"
    assert_content page, "Restaurant Owner?"

  end

  test "Clicking on food type icon brings up restaurants" do

    visit static_pages_home_path

    within("#food-types") do
      click_on "Bars"
    end

    assert_content page, "Dive Bar"

    within("#food-types") do
      click_on "American"
    end

    assert_content page, "Platable"
    refute_content page, "Dive Bar"

  end

  test "Clicking on sign up redirects to sign up form" do

    visit static_pages_home_path

    click_on "Sign Up"

    assert_content page, "Confirm Password:"


  end

  test "Clicking on sign in redirects to sign in form" do

    visit static_pages_home_path
    click_on "Sign In"

    assert_content page, "Email:"
    refute_content page, "Confirm Password:"

  end

  test "Signing in remove Sign Up from home page" do

    user1 = User.new({username: 'regular', password: 'password'})
    assert user1.save

    visit static_pages_home_path
    click_on "Sign In"

    fill_in "Username", with: 'regular'
    fill_in "Password", with: 'password'

    click_button "Login"
    assert_content page, "Satisfy Your Craving"
    assert_content page, "Logout"
    refute_content page, 'Sign In'

  end

  test "Choosing join craveyard redirects to sign up and join form" do
    visit static_pages_home_path
    click_on "Join Craveyard"

    assert_content page, "Sign In Now"
    assert_content page, "Join"

  end

  test "Signing in Redirects to New Restaurant Application" do

    user1 = User.new({username: 'regular', password: 'password'})
    assert user1.save

    visit static_pages_home_path
    click_on "Join Craveyard"

    fill_in "Username", with: 'admin'
    fill_in "Password", with: 'password'

    click_button "Sign In"

    assert_content page, "New Restaurant Application"

  end

  test "Signing Up Redirects to New Restaurant Application" do

    visit static_pages_home_path
    click_on "Join Craveyard"

    fill_in "Username", with: 'admin'
    fill_in "Password", with: 'password'
    fill_in "Password Confirmation", with: 'password'

    click_button "Sign Up"

    assert_content page, "New Restaurant Application"

  end

end
