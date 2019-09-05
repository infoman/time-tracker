FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password { 'testpassword' }

    trait :manager do
      role { :manager }
    end

    trait :admin do
      role { :admin }
    end
  end
end
