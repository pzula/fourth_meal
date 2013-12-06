require 'spec_helper'

describe Order do

  it "should find pending orders" do
    expect(Order.all.count).to eq(0)
    user = FactoryGirl.create(:user)
    order = FactoryGirl.create(:order, user: user)
    expect(Order.all.count).to eq(1)
    expect(Order.pending.count).to eq(1)
    order = FactoryGirl.create(:order, user: user, status: "paid")
    expect(Order.all.count).to eq(2)
    expect(Order.pending.count).to eq(1)
  end

  it "should hold items" do
    user = FactoryGirl.create(:user)
    order = FactoryGirl.create(:order, user: user)
  end
  
end
