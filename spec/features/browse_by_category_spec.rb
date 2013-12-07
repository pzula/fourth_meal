require 'spec_helper'

describe "A public user", :type => :feature do
  
  it "browsing a menu by category" do
    cat1 = FactoryGirl.create(:category, name: "Plates")
    cat2 = FactoryGirl.create(:category, name: "Desserts")
    item1 = FactoryGirl.create(:item, title: "Bread")
    item2 = FactoryGirl.create(:item, title: "Cheese")
    item_category1 = FactoryGirl.create(:item_category, item: item1, category: cat1)
    item_category2 = FactoryGirl.create(:item_category, item: item2, category: cat2)

    visit items_path
    select('Plates', :from => 'Categories')
    click_button "Browse by Category"
    within("#items > ul") do
      expect(page).not_to have_text("Desserts")
    end
  end


end
