FactoryBot.define do
  factory :inventory do
    name { 'Sample Inventory' }
    description { 'Sample description' }
    association :user
  end
end
