class List < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_many :tasks

  validates :list_name, presence: true, length: { maximum: 20 }
end
