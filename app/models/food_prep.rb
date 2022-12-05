class FoodPrep < ApplicationRecord
  has_many :food_prep_labels, dependent: :destroy
  has_many :labels, through: :food_prep_labels, source: :label
  has_many :select_food_preps, dependent: :destroy
end
