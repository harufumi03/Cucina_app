class SelectFoodPrep < ApplicationRecord
  validates :group_id, presence: true
  validates :to_do_at, presence: true
  belongs_to :user
  belongs_to :food_prep
  belongs_to :group
  has_many :comments, dependent: :destroy

  def start_time
    self.to_do_at
  end
end
