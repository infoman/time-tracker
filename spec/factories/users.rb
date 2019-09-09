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

    # Not using just `profile` because it fails to validate somehow
    after :build do |user|
      build :profile, user: user
    end
  end
end
