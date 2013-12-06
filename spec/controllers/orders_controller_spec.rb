require 'spec_helper'

describe OrdersController do

  it "should store the order in a cookie" do
    item = FactoryGirl.create(:item)
    order = FactoryGirl.create(:order)
    order_item = FactoryGirl.create(:order_item, item: item, order: order)
    cookies[:order_id] = order.id
    get :show, id: cookies[:order_id]
    expect(response.status).to eq(200)     
  end
end
