require 'spec_helper'

describe Restaurant do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:url_slug) }
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

  it "can have a description" do
    restaurant = FactoryGirl.create(:restaurant, description: "An awesome american grill")
    
    restaurant.should be_valid
  end

  
  it "has the appropriate type of url slug" do 
    restaurant = FactoryGirl.build(:restaurant, url_slug: "%&_&^")
    restaurant.should_not be_valid
    restaurant = FactoryGirl.build(:restaurant, url_slug: "helloworld")
    restaurant.should be_valid
  end

  it "saves a downcased version of the url_slug in the database" do 
    restaurant = FactoryGirl.create(:restaurant, url_slug: "HeLLoWoRlD")
    expect(restaurant.url_slug).to eq("helloworld")
  end

  it "it rejects url_slugs that are not unique" do 
    restaurant = FactoryGirl.create(:restaurant, url_slug: "persalovestests" )
    restaurant.should be_valid
    restaurant_invalid = FactoryGirl.build(:restaurant, url_slug: "persalovestests")
    restaurant_invalid.should_not be_valid
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
