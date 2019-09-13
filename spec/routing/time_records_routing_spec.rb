require "rails_helper"

RSpec.describe TimeRecordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/users/2/time_records").to route_to("time_records#index", user_id: "2")
    end

    it "routes to #new" do
      expect(:get => "/users/2/time_records/new").to route_to("time_records#new", user_id: "2")
    end

    it "routes to #new wit a specific date" do
      expect(:get => "/users/2/time_records/new/2019-09-13").to route_to("time_records#new",
        user_id: "2",
        date: '2019-09-13')
    end

    it "routes to #show" do
      expect(:get => "/users/2/time_records/1").to route_to("time_records#show", id: "1", user_id: "2")
    end

    it "routes to #edit" do
      expect(:get => "/users/2/time_records/1/edit").to route_to("time_records#edit", id: "1", user_id: "2")
    end


    it "routes to #create" do
      expect(:post => "/users/2/time_records").to route_to("time_records#create", user_id: "2")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/2/time_records/1").to route_to("time_records#update", id: "1", user_id: "2")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/2/time_records/1").to route_to("time_records#update", id: "1", user_id: "2")
    end

    it "routes to #destroy" do
      expect(:delete => "/users/2/time_records/1").to route_to("time_records#destroy", id: "1", user_id: "2")
    end
  end
end
