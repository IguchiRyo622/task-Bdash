FactoryBot.define do
  factory :list do
    list_name { Faker::Name.initials(number: 5) }
    association :user
    association :team
  end
end
