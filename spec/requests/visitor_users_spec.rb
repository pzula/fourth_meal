require 'spec_helper'

describe "VisitorUsers" do
  describe "GET /visitor_users" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get visitor_users_path
      expect(response.status).to be(200)
    end
  end
end
