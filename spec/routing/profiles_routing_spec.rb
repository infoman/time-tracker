require "rails_helper"

RSpec.describe ProfilesController, type: :routing do
  describe "routing" do
    it "routes to #edit" do
      expect(:get => "/users/1/profile/edit").to route_to("profiles#edit", :user_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/1/profile").to route_to("profiles#update", :user_id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/1/profile").to route_to("profiles#update", :user_id => "1")
    end
  end
end
