class Relationship < ApplicationRecord
  with_options presence: true do
    validates :follower_id
    validates :following_id
  end

  belongs_to :follower, class_name: 'User'
  belongs_to :following, class_name: 'User'
end
