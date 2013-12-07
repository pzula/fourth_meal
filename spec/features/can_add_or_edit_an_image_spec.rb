require 'spec_helper'

describe "Admin editing an item", :type => :feature do 
  
  it "can add an image to an existing item" do 
    user = FactoryGirl.create(:user, admin: true, username: "admin", password: "password")
    item = FactoryGirl.create(:item, title: "Deviled Eggs")
    visit root_path
    click_on "Login"

    fill_in "Username", with: 'admin'
    fill_in "Password", with: 'password'
    click_button "Login"

    visit edit_item_path(item.id)
    attach_file("item_image", "./app/assets/images/deviled_eggs.jpg")
    click_button "Update"
    page.find(".item-show-image")['src'].should have_content("deviled_eggs.jpg")
  
  end
end
