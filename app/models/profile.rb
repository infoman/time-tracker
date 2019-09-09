class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates_numericality_of :expected_hours,
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 24
end
