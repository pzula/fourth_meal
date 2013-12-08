require 'spec_helper'

describe "Admin logged in to site", :type => :feature do 
  before :each do
    @admin = FactoryGirl.create(:user, username: "admin", password: "password", admin: true) 
    visit root_path
    click_on "Login"
    fill_in "Username", with: 'admin'
    fill_in "Password", with: 'password'
    click_button "Login"
  end

  it "can log in" do
    expect(page).not_to have_text("Login")
  end

  it "can view all users" do
    visit users_path
    expect(current_path).to include("/users")
  end

  it "can view individual user profile" do
    user = FactoryGirl.create(:user, username: "bob_bob", password: "password")
    visit user_path(user)
    expect(page).to have_text("bob_bob")
  end

  it "can create an item" do
    pending
    visit new_item_path
    expect(page).not_to have_text("deviled eggs")
    fill_in "Title", :with => "deviled eggs"
    fill_in "Description", :with => "12 luscious eggs"
    fill_in "Price", :with => "3"
    click_button "Add Item"
    expect(page).to have_text("deviled eggs")
    expect(page).to have_text("12 luscious eggs")
    expect(page).to have_text("3")
  end

  it "can edit an item" do
    item = FactoryGirl.create(:item)
    visit edit_item_path(item)
    expect(page).not_to have_text("Soft loafy gluten")
    fill_in "Description", :with => "Soft loafy gluten"
    click_button "Update item"
    expect(page).to have_text("Soft loafy gluten")
  end

  it "can see current orders" do
    item = FactoryGirl.create(:item, title: "bunny")
    order = FactoryGirl.create(:order)
    order_item = FactoryGirl.create(:order_item, item: item, order: order)
    visit orders_path
    within("#orders") do
      expect(page).to have_text("bunny")
      expect(page).to have_text("pending")
    end
  end

  it "can see original category when editing an item" do
    item = FactoryGirl.create(:item, title: "Guinea Pig", description: "fluffy")
    category = FactoryGirl.create(:category, name: "Peruvian")
    category2 = FactoryGirl.create(:category, name: "Scandinavian")
    item_category = FactoryGirl.create(:item_category, item: item, category: category)
    visit edit_item_path(item)
    page.has_checked_field?("item_category_1")
    page.has_unchecked_field?("item_category_2")
  end




end
