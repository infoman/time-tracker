# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
