require 'spec_helper'

describe Restaurant do
  it { should validate_presence_of(:name) }
  #it { should validate_presence_of(:url_slug) }
  it { should validate_presence_of(:status) }

  it "cannot have a name shorter than 3 characters" do
    restaurant = FactoryGirl.build(:restaurant)
    restaurant.should be_valid
    
    restaurant.update_attributes(:name => "Du")
    restaurant.should_not be_valid
  end
  
  it "should have a default status of pending" do
    restaurant = Restaurant.new(name: "Interstate", url_slug: "interstate")

    restaurant.save
    expect(restaurant.status).to eq("pending")
  end
  
  it "can have a food type" do
    restaurant = FactoryGirl.create(:restaurant, food_type: "American")
    expect(restaurant.food_type).to eq("American")
  end

  it "should be invalid without a food type" do
    restaurant = FactoryGirl.build(:restaurant, food_type: nil)
    expect(restaurant).to be_invalid
  end
end
