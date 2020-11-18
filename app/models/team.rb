class Team < ApplicationRecord
  validates :team_name, presence: true

  has_many :team_users
  has_many :users, through: :team_users
end
