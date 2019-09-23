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
