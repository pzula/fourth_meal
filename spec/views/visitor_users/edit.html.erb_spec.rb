require 'spec_helper'

describe "visitor_users/edit" do
  before(:each) do
    @visitor_user = assign(:visitor_user, stub_model(VisitorUser,
      :email => "MyString"
    ))
  end

  it "renders the edit visitor_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", visitor_user_path(@visitor_user), "post" do
      assert_select "input#visitor_user_email[name=?]", "visitor_user[email]"
    end
  end
end
