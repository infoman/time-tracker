require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to(:user) }
  it { should validate_numericality_of(:expected_hours).
    only_integer.
    is_greater_than_or_equal_to(0).
    is_less_than_or_equal_to(24)
  }
end
