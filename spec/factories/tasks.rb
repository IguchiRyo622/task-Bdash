FactoryBot.define do
  factory :task do
    task_name              { Faker::Team.name }
    content                { 'ここにタスク内容を書きます' }
    target_date            { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    association :list
    association :user
  end
end
