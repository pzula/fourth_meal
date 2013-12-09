require 'spec_helper'

describe "visitor_users/new" do
  before(:each) do
    assign(:visitor_user, stub_model(VisitorUser,
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new visitor_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", visitor_users_path, "post" do
      assert_select "input#visitor_user_email[name=?]", "visitor_user[email]"
    end
  end
end
