require 'spec_helper'

describe User do
 
  before :each do 
    @user = FactoryGirl.create(:user)
    @order = FactoryGirl.create(:user_order, customer: @user)
  end

  it "should have orders" do
    @user.orders.should include(@order)
  end

  it "is not an admin by default" do
    @user.should_not be(@user.admin)
  end

  it "can be made to be an admin" do 
    user = FactoryGirl.create(:user, admin: true)
    user.admin.should be(true)
  end

  it "can complete an order" do
    @user.change_order_to_completed
    @user.orders.last.status.should eq("completed")
  end


  it "can find it's recent completed orders" do
    order = FactoryGirl.create(:user_order, customer: @user, status: 'completed')
    @user.recent_orders.each do |order|
      expect(order.status).to eq('completed')
    end
  end

  it "can find by username" do
    pam = FactoryGirl.create(:user, :username => "pam", :email => "pam@example.com")
    steve = FactoryGirl.create(:user, :username => "steve", :email => "steve@example.com")
    searched_user = User.find_by_email("pam@example.com")
    expect(searched_user.username).to eq("pam")
    expect(searched_user.username).to_not eq("steve")
  end

end
