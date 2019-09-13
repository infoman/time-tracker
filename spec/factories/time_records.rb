FactoryBot.define do
  factory :time_record do
    user
    date { "2019-09-11" }
    hours { "1.11" }
    description { "A usual description for time record" }
  end
end
