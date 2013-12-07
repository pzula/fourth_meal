require 'spec_helper'

describe "A public user", :type => :feature do
  
  before :each do 
    @cat1 = FactoryGirl.create(:category, name: "Plates")
    @cat2 = FactoryGirl.create(:category, name: "Desserts")
    @item1 = FactoryGirl.create(:item, title: "Bread")
    @item2 = FactoryGirl.create(:item, title: "Cheese")
    @item_category1 = FactoryGirl.create(:item_category, item: @item1, category: @cat1)
    @item_category2 = FactoryGirl.create(:item_category, item: @item2, category: @cat2)
  end


  it "browsing a menu by category" do
    visit items_path
    select('Plates', :from => 'Categories')
    click_button "Browse by Category"
    within("#items > ul") do
      expect(page).not_to have_text("Desserts")
    end
  end

  it "can click tag to see all items with that tag" do
    visit items_path

    within("#item_1") do
      click_on "Plates"
    end

    expect(page).to have_text("Bread")
    expect(page).not_to have_text("Cheese")
  end

end
