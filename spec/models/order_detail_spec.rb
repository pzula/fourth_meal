require 'spec_helper'

describe OrderDetail do
  before :each do
    user = FactoryGirl.create(:user)
    order = FactoryGirl.create(:order, user: user)
    item = FactoryGirl.create(:item)
    order_item = FactoryGirl.create(:order_item, order: order, item: item)
  end

  it "saves data to the OrderDetails table" do
    order_details = OrderDetail.create({:first_name => "Joe",
                                    :last_name => "Smith",
                                    :email => "email@email.com",
                                    :delivery_street => "123 S. Main.",
                                    :delivery_address_2 => "Apt. 201",
                                    :delivery_city => "Denver",
                                    :delivery_state => "CO",
                                    :delivery_zip => "80204"})
    expect(OrderDetail.first.first_name).to eq("Joe")
    expect(order_details.last_name).to eq("Smith")
    expect(order_details.email).to eq("email@email.com")
    expect(order_details.delivery_street).to eq("123 S. Main.")
    expect(order_details.delivery_address_2).to eq("Apt. 201")
    expect(order_details.delivery_city).to eq("Denver")
    expect(order_details.delivery_state).to eq("CO")
    expect(order_details.delivery_zip).to eq("80204")
  end

end
