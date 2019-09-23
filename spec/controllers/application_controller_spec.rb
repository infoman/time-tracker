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

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def access_denied
      raise CanCan::AccessDenied, 'Test message'
    end
  end

  describe "handles CanCan::AccessDenied exception" do
    before :each do
      routes.draw { get "access_denied" => "anonymous#access_denied" }
    end

    it "redirects to the previous page" do
      request.env['HTTP_REFERER'] = users_url

      get :access_denied

      expect(response).to redirect_to :users
    end

    it "redirects to the home page if no referer set" do
      get :access_denied

      expect(response).to redirect_to :root
    end

    it "sets flash alert message" do
      get :access_denied

      expect(flash[:alert]).to eq 'Test message'
    end
  end
end
