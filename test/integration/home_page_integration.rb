require "./test/test_helper"

class HomePageIntegrationTest < Capybara::Rails::TestCase

  test "home page has correct content for Public User" do

    visit root_path
    
    assert_content page, "Sign Up"
    assert_content page, "Sign In"

    assert_content page, "Satisfy Your Craving"

    assert_content page, "Pick a Restaurant"

    assert_content page, "Restaurant Owner?"
  end

  test "Clicking on food type icon brings up restaurants" do

    visit root_path

    within("#food_types") do
      click_on "Bars"
    end

    assert_content page, "Dive Bar"

    within("#food_types") do
      click_on "American"
    end

    assert_content page, "Platable" 
    refute_content page, "Dive Bar"
end
