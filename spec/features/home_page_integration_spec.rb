require 'spec_helper'

describe "The home page experience", :type => :feature do

  it "brings up the correct type of restraunt when type is selected" do
    pending
    visit root_path

    within("#food-types") do
      click_on "Bars"
    end

    expect(page).to have_text("Dive Bar")

    within("#food-types") do
      click_on "American"
    end

    expect(page).to have_text("Platable")
    expect(page).not_to have_text("Dive Bar")
  end

  it "redirects to the sign up form when sign up is clicked" do
    pending
    visit static_pages_home_path
   
    click_on "Sign Up"

    expect(page).to have_text("Confirm Password:")
  end

  
  it "rediects to the sign in form when the sign in button is clicked" do
    pending
    visit root_path
    click_on "Sign In"

    expect(page).to have_text("Email:")
    expect(page).not_to have_text("Confirm Password:")
  end

  it "removes the sign up button after signing in" do
    user = FactoryGirl.create(:user, username: "user", password: "password")

    visit root_path

    click_on "Sign In"

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"

    click_button "Login"
    expect(page).to have_text("Satisfy Your Craving")
    expect(page).to have_text("Logout")
    expect(page).not_to have_text("Sign In")
  end

  it "redirects a public visitor to the join page when clicking 'Join Craveyard'" do
    pending
    visit root_path
    click_on "Join Craveyard"

    expect(page).to have_text("Sign In Now")
    expect(page).to have_text("Create An Account")
  end
   
end

