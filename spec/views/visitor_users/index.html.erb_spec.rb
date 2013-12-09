require 'spec_helper'

describe "visitor_users/index" do
  before(:each) do
    assign(:visitor_users, [
      stub_model(VisitorUser,
        :email => "Email"
      ),
      stub_model(VisitorUser,
        :email => "Email"
      )
    ])
  end

  it "renders a list of visitor_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
