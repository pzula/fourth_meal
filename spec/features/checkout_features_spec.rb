require 'spec_helper'

describe "Adding an item to the cart", :type => :feature do 

  before :each do 
    item1 = Item.new(title: "Deviled Eggs", description: "twelve luscious eggs", price: 1, restaurant_id: 1)
    item2 = Item.new(title: "Waffles", description: "syrup", price: 3, restaurant_id: 1)
    item3 = Item.new(title: "quinoa", description: "grainy", price: 9, restaurant_id: 1)
    item1.save
    item2.save
    item3.save
  end

   it "updates the cart with a visual indicator" do 
    visit "/platable/menu" 
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
    visit "/platable/menu" 
    expect(page).to have_text("Deviled Eggs")
     within("#item_2") do 
       click_on "Add to Order"
     end
     within("#item_2") do 
       click_on "Add to Order"
     end
    
     current_url.should == "http://www.example.com/platable/menu"
  end

end
