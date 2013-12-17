require 'spec_helper'

describe OrdersController do

  it "should store the order in a session" do
    item = FactoryGirl.create(:item)
    order = FactoryGirl.create(:guest_order)
    order_item = FactoryGirl.create(:order_item, item: item, order: order)
    session[:order_id] = order.id
    get :show, id: session[:order_id]
    expect(response.status).to eq(200)
  end
end
