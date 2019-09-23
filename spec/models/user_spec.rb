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

RSpec.describe User, type: :model do
  it { should have_one(:profile).dependent(:destroy) }
  it { should have_many(:time_records).dependent(:destroy) }
  it { should define_enum_for(:role) }

  it "should map role id to specific role" do
    expect(User.roles).to include({
      user: 0,
      manager: 1,
      admin: 2
    })
  end

  it "should have a profile after creation" do
    user = User.create attributes_for(:user)

    expect(user.profile).to be_a Profile
  end

  it "should be a regular user by default" do
    user = User.new

    expect(user.role.to_sym).to eq(:user)
  end

  describe "#display_name" do
    before :each do
      @user = build :user
    end

    context "with full name defined in profile settings" do
      it "should return user's full name" do
        @user.profile.full_name = 'Really Full Name'

        expect(@user.display_name).to eq('Really Full Name')
      end
    end

    context "without a full name" do
      it "should return user's e-mail address" do
        @user.profile.full_name = nil

        expect(@user.display_name).to eq(@user.email)
      end
    end
  end
end
