require 'spec_helper'

describe "Customer on my orders page", :type => :feature do 

  before :each do 
    @platable = FactoryGirl.create(:restaurant, name: "Platable", url_slug: "platable")
    @dive_bar = FactoryGirl.create(:restaurant, name: "Dive Bar", url_slug: "dive_bar")
    @sad_bar = FactoryGirl.create(:restaurant, name: "Sad Unused Restaurant", url_slug: "sad_bar")
    @item1 = FactoryGirl.create(:item_unique, title: "Deviled Eggs", description: "twelve luscious eggs", price: 1, restaurant: @platable)
    @item2 = FactoryGirl.create(:item_unique, title: "Waffles", description: "syrup", price: 3, restaurant: @platable)
    @item3 = FactoryGirl.create(:item_unique, title: "quinoa", description: "grainy", price: 9, restaurant: @dive_bar)
    visit restaurant_path(@platable)
    within("#item_#{@item1.id}") do
      click_on "Add to Order"
    end
    within("#item_#{@item2.id}") do
      click_on "Add to Order"
    end
    visit restaurant_path(@dive_bar)
    within("#item_#{@item3.id}") do
      click_on "Add to Order"
    end
  end

  it "should only see restaurants where it has an order" do
    click_on "My Order (3)"
    expect(page).to have_text("Platable")
    expect(page).to have_text("Dive Bar")
    expect(page).to_not have_text("Sad Unused Restaurant")
  end

  it "should see items within restaurant" do
    click_on "My Order (3)"
    expect(page).to have_text("quinoa")
    within(".restaurant-#{@platable.url_slug}") do
      expect(page).to have_link("Waffles")
      expect(page).to_not have_link("quinoa")
    end
  end

  it "should see a subtotal per restaurant" do
    click_on "My Order (3)"
    expect(page).to have_text("13")
    within(".restaurant-#{@platable.url_slug}") do
      expect(page).to have_text("4")
    end
    within(".restaurant-#{@dive_bar.url_slug}") do
      expect(page).to have_text("9")
    end
  end

  it "should not see a subtotal if there are no orders" do
    click_on "My Order (3)"
    click_link "remove_item_#{@item1.id}"
    click_link "remove_item_#{@item2.id}"
    click_link "remove_item_#{@item3.id}"
    expect(page).to_not have_text("All Orders Total")
  end

  it "should not add another user's orders to cart"

  it "should have a checkout button that displays items per shop" do
    click_on "My Order (3)"
    within(".restaurant-#{@platable.url_slug}") do
      expect(page).to have_link("Waffles")
      expect(page).to_not have_link("quinoa")
      click_on "Checkout"
    end
    expect(page).to_not have_text("quinoa")
    expect(page).to have_text("Waffles")
    expect(page).to have_text("Order Total: $4.00")
  end

  it "should have a checkout all button that displays all items in order" do
    click_on "My Order (3)"
    click_on "Checkout All Orders"
    expect(page).to have_text("Finish Your Order")
    expect(page).to have_text("Waffles")
    expect(page).to have_text("quinoa")
    expect(page).to have_text("Deviled Eggs")
    expect(page).to have_text("13")
  end

  it "checking out one restauarant should not remove all orders"
end
