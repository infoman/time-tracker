FactoryBot.define do
  factory :profile do
    sequence(:full_name) { |n| "User Name #{n}" }
    sequence(:expected_hours) { |n| n % 24 }
  end
end
