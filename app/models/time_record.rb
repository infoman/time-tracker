class TimeRecord < ApplicationRecord
  belongs_to :user

  validates_numericality_of :hours,
    greater_than: 0,
    less_than_or_equal_to: 24

  after_initialize do
    self.date ||= Date.today
  end
end
