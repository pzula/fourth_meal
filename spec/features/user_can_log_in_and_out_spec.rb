require 'spec_helper'

describe "A guest ", :type => :feature do 

it "can log in" do
  user = FactoryGirl.create(:user)
  visit root_path
  click_on "Login"

  fill_in "Username", with: 'user'
  fill_in "Password", with: 'password'
  click_button "Login"
  visit root_path
  expect(page).to have_content("Craveyard")
  
end

end
