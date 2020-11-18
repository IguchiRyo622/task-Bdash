class Team < ApplicationRecord
  has_many :team_users
  has_many :users, through: :team_users, validate: false

  validates :team_name, presence: true
end
