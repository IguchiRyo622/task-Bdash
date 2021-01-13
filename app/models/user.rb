class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, length: { maximum: 20 }

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英数字混合で入力してください' } do
      validates :password, on: :create
      validates :user_name, uniqueness: { case_sensitive: true }
    end
  end

  has_many :team_users
  has_many :teams, through: :team_users
  has_many :lists
  has_many :tasks
  has_many :browsing_tasks, dependent: :destroy
  has_many :comments
  has_many :items

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end
  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end
  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
end
