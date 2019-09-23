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

RSpec.describe TimeRecord, type: :model do
  it { should belong_to(:user) }
  it { should validate_numericality_of(:hours).
    is_greater_than(0).
    is_less_than_or_equal_to(24)
  }

  it "should have date set to today by default" do
    record = TimeRecord.new

    expect(record.date).to eq(Date.today)
  end
end
