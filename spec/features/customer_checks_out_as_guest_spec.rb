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

  end

end
