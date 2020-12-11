FactoryBot.define do
  factory :item do
    task_item { Faker::Lorem.sentence }
    check { false }
    association :user
    association :task
  end
end
