require 'spec_helper'

describe User do

  it "should have orders" do
    user = FactoryGirl.create(:user)
    order = FactoryGirl.create(:order, user: user)
    user.orders.should include(order)
  end

end
