require "spec_helper"

describe VisitorUsersController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/visitor_users").to route_to("visitor_users#index")
    end

    it "routes to #new" do
      expect(:get => "/visitor_users/new").to route_to("visitor_users#new")
    end

    it "routes to #show" do
      expect(:get => "/visitor_users/1").to route_to("visitor_users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/visitor_users/1/edit").to route_to("visitor_users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/visitor_users").to route_to("visitor_users#create")
    end

    it "routes to #update" do
      expect(:put => "/visitor_users/1").to route_to("visitor_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/visitor_users/1").to route_to("visitor_users#destroy", :id => "1")
    end

  end
end
