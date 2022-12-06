class Comment < ApplicationRecord
  belongs_to :select_food_prep
  belongs_to :user
  validates :content, presence: true
end
