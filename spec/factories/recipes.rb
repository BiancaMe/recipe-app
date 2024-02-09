FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    preparation_time { "#{Faker::Number.between(from: 0, to: 120)} minutes" }
    cooking_time { "#{Faker::Number.between(from: 0, to: 60)} minutes" }
    description { Faker::Lorem.paragraph }
    public { true }
    association :user
  end
end
