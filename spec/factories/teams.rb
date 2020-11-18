FactoryBot.define do
  factory :team do
    team_name              {Faker::Name.initials(number: 2)}
  end
end
