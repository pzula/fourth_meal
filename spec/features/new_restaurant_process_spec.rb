require 'spec_helper'

describe "Customer on creating a restaurant", :type => :feature do 

  before :each do 
    @platable = FactoryGirl.create(:restaurant, name: "Platable", url_slug: "platable")
    @user = FactoryGirl.create(:user)
    visit root_path
      click_on "Login"
      fill_in "Username", with: "Joe"
      fill_in "Password", with: 'password'
      click_button "Login"
    visit new_restaurant_path    
  end

  it "can create restaurant and restaurant details" do
    fill_in "Name", with: "Test Restaurant"
    fill_in "Url slug", with: "test-restaurant"
    fill_in "Food type", with: "Italian"
    fill_in "Phone", with: "8008764545"
    fill_in "Street Address", with: "425 Walking St."
    fill_in "Street Address Continued", with: "Second Floor"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zipcode", with: "80203"
    fill_in "Description", with: "This is a wonderful place to eat, don't you know!"
    check('Do You Deliver?')
    fill_in "Delivery Range (in miles)", with: "20"
    click_button "Apply for Restaurant Approval"
    visit user_path(@user)
    expect(page).to have_text("Test Restaurant")
    expect(page).to have_text("This is a wonderful place to eat, don't you know!")
    expect(page).to_not have_text("Platable")
  end

  it "see the new restaurant in my dashboard" do
    fill_in "Name", with: "Test Restaurant"
    fill_in "Url slug", with: "test-restaurant"
    fill_in "Food type", with: "Italian"
    click_button "Apply for Restaurant Approval"
    visit user_path(@user)
    expect(page).to have_text("Test Restaurant")
    expect(page).to_not have_text("Platable")
  end

end
