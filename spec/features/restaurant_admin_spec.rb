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

  it "see the new restaurant in my dashboard" do
    fill_in "Name", with: "Test Restaurant"
    fill_in "Description", with: "Nice New Restaurant"
    fill_in "Url slug", with: "test-restaurant"
    fill_in "Food type", with: "Italian"
    click_button "Apply for Restaurant Approval"
    visit user_path(@user)
    expect(page).to have_text("Test Restaurant")
    expect(page).to_not have_text("Platable")
  end

end
