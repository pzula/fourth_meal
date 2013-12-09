require 'spec_helper'

describe "visitor_users/show" do
  before(:each) do
    @visitor_user = assign(:visitor_user, stub_model(VisitorUser,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Email/)
  end
end
