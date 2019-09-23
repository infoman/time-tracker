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

RSpec.describe "time_records/edit", type: :view do
  before(:each) do
    @time_record = assign :time_record, create(:time_record)
    @user = assign :user, @time_record.user
  end

  it "renders the edit time_record form" do
    render

    assert_select "form[action=?][method=?]", user_time_record_path(@user, @time_record), "post" do

      assert_select "input[name=?]", "time_record[hours]"

      assert_select "textarea[name=?]", "time_record[description]"
    end
  end
end
