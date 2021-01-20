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

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :following
  has_many :follower_user, through: :followed, source: :follower

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(following_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(following_id: user_id).destroy
  end

  # フォロー確認をおこなう
  def following?(user)
    following_user.include?(user)
  end

  def self.search(search)
    if search != ""
      User.where('user_name LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end
end
