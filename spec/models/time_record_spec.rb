require 'rails_helper'

RSpec.describe TimeRecord, type: :model do
  it { should belong_to(:user).dependent(:destroy) }
  it { should validate_numericality_of(:hours).
    is_greater_than(0).
    is_less_than_or_equal_to(24)
  }

  it "should have date set to today by default" do
    record = TimeRecord.new

    expect(record.date).to eq(Date.today)
  end
end
