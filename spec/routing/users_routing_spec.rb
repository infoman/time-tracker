require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/users").to route_to("users#index")
    end

    it "routes to #show" do
      expect(:get => "/users/1").to route_to("users#show", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/users/1").to route_to("users#destroy", :id => "1")
    end

    it "routes to #set_role via PATCH" do
      expect(:patch => "/users/1/set_role").to route_to("users#set_role", :id => "1")
    end
  end
end
