require 'spec_helper'

describe "A shopper ", :type => :feature do

  before :each do 
    @item1 = FactoryGirl.create(:item, title: "Burger", description: "MEATSLICE", price: "12")
    @item2 = FactoryGirl.create(:item, title: "Caviar", description: "Eggy weegs", price: "10000")
  end

  it "can add items to their cart without signing in" do
    visit items_path
    within("#item_1") do
      click_on "Add to Order"
    end
    within("#item_2") do
      2.times {click_on "Add to Order" }
    end
    click_on "My Order (3)"
    expect(page).to have_content("Burger")
    expect(page).to have_content("Caviar")
    expect(current_path).to eq("/orders/1")
  end

  it "cannot set the quantity of an item in their cart to a negative number" do
    visit items_path
    within("#item_1") do
      click_on "Add to Order"
    end

    click_on "My Order (1)"
    fill_in 'order_item_quantity', with: '-5'
    click_on 'Adjust Quantity'
    expect(page).to have_content("There was an error.")
    expect(find_field('order_item_quantity').value).to eq("1")
  end

  it "can adjust items in their cart" do
    visit items_path
    within("#item_1") do
      click_on "Add to Order"
    end

    click_on "My Order (1)"
    fill_in 'order_item_quantity', with: '5'
    click_on 'Adjust Quantity'
    expect(find_field('order_item_quantity').value).to eq("5")
  end

  it "can remove item from their cart" do
    visit items_path
    within("#item_1") do
      click_on "Add to Order"
    end
    within("#item_2") do
      2.times {click_on "Add to Order" }
    end
    click_on "My Order (3)"
    
    click_link "remove_item_#{@item1.id}"

    expect(page).not_to have_content("Burger")

    click_link "remove_item_#{@item2.id}"

    expect(page).to have_content("Your Cart is Empty")
  end

  it "should not see items after that item quantity is set to zero" do
    pending
    visit items_path
    within("#item_1") do
      click_on "Add to Order"
    end
    click_on "My Order (1)"
    within("#item_1") do
      fill_in "order_item_quantity", with: 0
      click_on "Adjust Quantity"
    end
    expect(page).not_to have_content("There was an error.")
  end

end
