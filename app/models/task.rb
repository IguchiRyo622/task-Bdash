class Task < ApplicationRecord
  belongs_to :list

  validates :task_name, presence: true, length: { maximum: 20 }
end
