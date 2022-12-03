class FoodPrep < ApplicationRecord
  has_many :food_prep_labels, dependent: :destroy
  has_many :labels, through: :food_prep_labels, source: :label
  belongs_to :user
end
