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

RSpec.describe "time_records/index", type: :view do
  before(:each) do
    @user = assign :user, create(:user)
    @user.profile.update_attribute :expected_hours, 3

    @filter = DateFilter.new

    # 2 records with 1.11 hours each is less than 3 hours
    @today_records = create_list(:time_record, 2, user: @user, date: Date.today)

    # 3 records with 1.11 hours each is more than 3 hours
    @yesterday_records = create_list(:time_record, 3, user: @user, date: Date.yesterday)

    @time_records = assign :time_records, @today_records + @yesterday_records
    @dated_records = assign :dated_records, @time_records.group_by {|r| r.date}

    @totals = {}
    @dated_records.each do |date, records|
      @totals[date] = OpenStruct.new({
        hours: hours = records.sum {|record| record.hours },
        sufficient?: hours >= @user&.profile&.expected_hours
      })
    end
    assign :totals, @totals

    # index template includes ability checking to draw some buttons
    allow(controller).to receive(:current_ability).and_return(Ability.new(@user))
  end

  it "renders a list of 5 time_records" do
    render

    assert_select "tr.time-record>td", text: "1.11".to_s, count: 5
  end

  it "groups time_records by date" do
    render

    assert_select "tr.time-total", count: 2
  end

  it "renders date header in red for insufficient hours" do
    render

    assert_select "tr.bg-danger>td", text: /#{Date.today}/, count: 1
  end

  it "renders date header in green for sufficient hours" do
    render

    assert_select "tr.bg-success>td", text: /#{Date.yesterday}/, count: 1
  end

  it "says 'No description' for empty record description" do
    empty_record = create :time_record, user: @user, date: Date.today, description: nil

    assign :time_records, [empty_record]
    assign :dated_records, { Date.today => [empty_record] }

    render

    assert_select "td>em", text: 'No description'
  end
end
