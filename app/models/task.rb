class Task < ApplicationRecord
  belongs_to :list
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :task_name, presence: true, length: { maximum: 20 }
end
