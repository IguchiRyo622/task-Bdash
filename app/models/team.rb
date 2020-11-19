class Team < ApplicationRecord
  has_many :team_users
  has_many :users, through: :team_users, validate: false
  has_many :lists

  validates :team_name, presence: true
end
