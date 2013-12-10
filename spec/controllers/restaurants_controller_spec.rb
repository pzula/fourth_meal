require 'spec_helper'

describe RestaurantsController do
  
  it "should store the restaurant in a cookie" do
    restaurant = FactoryGirl.create(:restaurant)
    get :show, id: restaurant.id
    restaurant_url_slug = restaurant.url_slug
    cookies[:restaurant_slug] = restaurant_url_slug
    expect(cookies[:restaurant_slug]).to eq(restaurant_url_slug)     
  end
end
