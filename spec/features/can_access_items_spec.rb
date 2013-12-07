require 'spec_helper'

describe "A public user viewing a menu", :type => :feature do
  
  before :each do
    @item = FactoryGirl.create(:item, title: "Deviled Eggs", description: "12 luscious eggs", price: "1")
    category = FactoryGirl.create(:category, name: "Plates")
    item_category = FactoryGirl.create(:item_category, item: @item, category: category)
  end

  it "should see all menu items" do
    visit items_path
    expect(page).to have_text("Deviled Eggs")
    expect(page).not_to have_text("Bread")
  end

  it "should see item category" do 
    visit items_path 
    expect(page).to have_text("Plates")
  end

  it "should not see inactive items" do
    visit items_path
    expect(page).to have_text("Deviled Eggs")
    @item.update_attributes(:active => false)
    visit items_path
    expect(page).not_to have_text("Deviled Eggs")
  end

  it "should be able to get to an individual item page path"

end
