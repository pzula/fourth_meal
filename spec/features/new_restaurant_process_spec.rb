require 'spec_helper'

describe "Customer on creating a restaurant", :type => :feature do 

  before :each do 
    @platable = FactoryGirl.create(:restaurant, name: "Platable", url_slug: "platable")
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:user_admin)
    visit root_path
      click_on "Login"
      fill_in "Username", with: "Joe"
      fill_in "Password", with: 'password'
      click_button "Login"
    visit new_restaurant_path    
  end

  it "has a link to create a new restaurant from account page" do
    visit user_path(@user)
    expect(page).to have_link("Create a New Craveyard Website")
    click_on "Create a New Craveyard Website"
    expect(page).to have_button "Apply for Restaurant Approval"
  end

  it "can create restaurant and restaurant details" do
    fill_in "Name", with: "Test Restaurant"
    #fill_in "Url slug", with: "test-restaurant"
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
    #fill_in "Url slug", with: "test-restaurant"
    fill_in "Food type", with: "Italian"
    click_button "Apply for Restaurant Approval"
    visit user_path(@user)
    expect(page).to have_text("Test Restaurant")
    expect(page).to_not have_text("Platable")
  end

  it "should not see a denied restaurant in dashboard" do
    fill_in "Name", with: "Test Restaurant"
    fill_in "Food type", with: "Italian"
    click_button "Apply for Restaurant Approval"
    visit user_path(@user)
    expect(page).to have_text("Test Restaurant")
    click_on "Logout"
      click_on "Login"
      fill_in "Username", with: "Admin"
      fill_in "Password", with: 'password'
      click_button "Login"
    visit dashboard_path(@admin)
    click_on "Logout"
      click_on "Login"
      fill_in "Username", with: "Joe"
      fill_in "Password", with: 'password'
      click_button "Login"
    visit user_path(@user)
  end

  it "should be able to hire and fire employees" do
    @new_employee = FactoryGirl.create(:user, username: "new_employee", email: "employee@example.com")
    @restaurant_employee = FactoryGirl.create(:restaurant_employee, restaurant_id: @platable.id, user_id: @user.id, admin: true)
    visit user_path(@user)
    click_on "Platable"
    fill_in "Email", with: "employee@example.com"
    select 'admin', :from => 'Role'
    click_on "HIRE!"
    expect(page).to have_text("new_employee")
    within(".employeenew_employee") do
      click_on "Fire"
    end
    expect(page).to have_text("has been terminated")
    visit user_path(@user)
    click_on "Platable"
    expect(page).to_not have_text("new_employee")
  end

end

describe "SuperAdmin After New Restaurant Was Created", :type => :feature do 
  
  before :each do 
    @platable = FactoryGirl.create(:restaurant, name: "Platable", url_slug: "platable")
    @user = FactoryGirl.create(:user)
    uid = @user.id
    rid = @platable.id
    @restaurant_employee = FactoryGirl.create(:restaurant_employee, restaurant_id: rid, user_id: uid, admin: true)
    @still_pending = FactoryGirl.create(:restaurant, name: "Still Pending", url_slug: "pending")
    @admin = FactoryGirl.create(:user_admin)
    visit root_path
      click_on "Login"
      fill_in "Username", with: "Admin"
      fill_in "Password", with: 'password'
      click_button "Login" 
  end

  it "should see platable as a pending restaurant" do
    visit dashboard_path(@admin)
    expect(page).to have_text("Platable")
  end

  it "should be able to approve Platable" do
    visit restaurants_path
    within(".pending-restaurants") do
      expect(page).to have_text("Platable")
      expect(page).to have_text("Still Pending")
    end
    within(".active-restaurants") do
      expect(page).to_not have_text("Platable")
    end
    visit dashboard_path(@admin)
    within("#platable") do
      click_on "Review Application"
    end
    click_on "Approve"
    visit restaurants_path
    within(".pending-restaurants") do
      expect(page).to_not have_text("Platable")
      expect(page).to have_text("Still Pending")
    end
    within(".active-restaurants") do
      expect(page).to have_text("Platable")
      expect(page).to_not have_text("Still Pending")
    end
  end



end
