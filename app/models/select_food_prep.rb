class SelectFoodPrep < ApplicationRecord
  belongs_to :user
  belongs_to :food_prep
  has_many :comments, dependent: :destroy
end
