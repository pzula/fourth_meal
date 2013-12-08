require 'spec_helper'

describe "Adding an item to the cart", :type => :feature do 

  before :each do 
    @restaurant = FactoryGirl.create(:restaurant)
    item1 = FactoryGirl.create(:item_unique, title: "Deviled Eggs", description: "twelve luscious eggs", price: 1, restaurant: @restaurant)
    item2 = FactoryGirl.create(:item_unique, title: "Waffles", description: "syrup", price: 3, restaurant: @restaurant)
    item3 = FactoryGirl.create(:item_unique, title: "quinoa", description: "grainy", price: 9, restaurant: @restaurant)
    #item1 = Item.new(title: "Deviled Eggs", description: "twelve luscious eggs", price: 1, restaurant_id: 1)
    #item2 = Item.new(title: "Waffles", description: "syrup", price: 3, restaurant_id: 1)
    #item3 = Item.new(title: "quinoa", description: "grainy", price: 9, restaurant_id: 1)
    #item1.save
    #item2.save
    #item3.save
  end

   it "updates the cart with a visual indicator" do
    visit root_path
    visit restaurant_path(@restaurant)
    save_and_open_page
    expect(page).to have_text("Deviled Eggs")
     within("#item_2") do 
       click_on "Add to Order"
     end
     within("#item_2") do 
       click_on "Add to Order"
     end
    
    expect(page).to have_text("My Order (2)")
  end


  it "updates the cart without redirecting" do
    visit root_path
    visit restaurant_path(@restaurant)
    expect(page).to have_text("Deviled Eggs")
     within("#item_2") do 
       click_on "Add to Order"
     end
     within("#item_2") do 
       click_on "Add to Order"
     end
    
     current_path.should == restaurant_path(restaurant)
  end

end
