require 'spec_helper'

describe "A user who is checking out", :type => :feature do 

  it "can see all of their previous orders" do
    pending
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item)
    visit items_path
    within("#item_1") do
      click_on "Add to Order"
    end
  end

end
