class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname, length: { maximum: 20 }

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英数字混合で入力してください' } do
      validates :password
      validates :user_name, uniqueness: true
    end
  end
  
  has_many :team_users
  has_many :teams, through: :team_users
end
