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

RSpec.describe "time_records/new", type: :view do
  before(:each) do
    @user = assign :user, create(:user)
    @time_record = assign :time_record, TimeRecord.new(user: @user)
  end

  it "renders new time_record form" do
    render

    assert_select "form[action=?][method=?]", user_time_records_path(@user), "post" do
      assert_select "input[name=?]", "time_record[date]"
      assert_select "input[name=?]", "time_record[hours]"
      assert_select "textarea[name=?]", "time_record[description]"
    end
  end
end
