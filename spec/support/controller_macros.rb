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

module ControllerMacros
  def login_admin(owner: false)
    before(:each) do
      user = if (owner && @user.present?)
        @user.update_attribute :role, :admin
        @user.reload
      else
        FactoryBot.create(:user, :admin)
      end

      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end
  end

  def login_manager(owner: false)
    before(:each) do
      user = if (owner && @user.present?)
        @user.update_attribute :role, :manager
        @user.reload
      else
        FactoryBot.create(:user, :manager)
      end

      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end
  end

  def login_user(owner: false)
    before(:each) do
      user = if (owner && @user.present?)
        @user.update_attribute :role, :user
        @user.reload
      else
        FactoryBot.create(:user)
      end

      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end
  end
end
