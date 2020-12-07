class Item < ApplicationRecord
  belongs_to :task
  belongs_to :user

  validates :task_item, presence: true
end
