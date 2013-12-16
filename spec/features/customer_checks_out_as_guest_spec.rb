require 'spec_helper'

describe "a public visitor", :type => :feature do

  before :each do
    user = FactoryGirl.create(:user)
    @restaurant = FactoryGirl.create(:restaurant, url_slug: "fancy")
    item = FactoryGirl.create(:item_unique, restaurant: @restaurant)
    visit restaurant_path(@restaurant)
    within("#item_1") do
      click_on "Add to Order"
    end
  end

  context "when checking out" do

    it "has a url with the restaurant in the path"

    it "can click checkout" do
      visit restaurant_path(@restaurant)
      click_on "My Order (1)"
      expect(page).to have_link("Checkout")
    end

    it "I am asked for delivery details or prompted to log in" do
      visit restaurant_path(@restaurant)
      click_on "My Order (1)"
      click_on "Checkout"
      fill_in("First Name", :with => "Joe")
      fill_in("Last Name", :with => "Smith")
      fill_in("Email", :with => "joe@example.com")
      fill_in("Phone Number", :with => "555-555-5555")
      expect(page).to have_text("Delivery Address")
      within_fieldset("delivery-address") do
        fill_in("Street Address", :with => "123 Main St.")
        fill_in("Address Line 2", :with => "Apt 12")
        fill_in("City", :with => "Denver")
        fill_in("State", :with => "CO")
        fill_in("Zip", :with => "80204")
      end
    end
  end

  it "can check out as a guest" do
    pending
   PAYMENT_PROCESSOR = PaymentProcessors::Stub

   visit restaurant_path(@restaurant)
      click_on "My Order (1)" 
      click_button("submit")
      expect(page).to have_text("Thanks, you paid all the things!")
  end
end
