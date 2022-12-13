class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name, presence: true
  has_many :select_food_preps
  has_many :comments, dependent: :destroy
  has_many :groups, foreign_key: :owner_id
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users, source: :group

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guest"
    end
  end

  def self.guest
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "admin_guest"
      user.admin = true
    end
  end
end
