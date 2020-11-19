class List < ApplicationRecord
  belongs_to :team
  belongs_to :user

  validates :list_name, presence: true
end
