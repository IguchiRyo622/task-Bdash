class Task < ApplicationRecord
  belongs_to :list
  belongs_to :user
  has_many :comments

  validates :task_name, presence: true, length: { maximum: 20 }
end
