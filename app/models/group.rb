class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, source: :user
  has_many :food_preps, dependent: :destroy

  def invite_member(user)
    group_users.create(user: user)
  end
end
