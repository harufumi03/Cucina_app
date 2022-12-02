class Label < ApplicationRecord
  has_many :food_prep_labels, dependent: :destroy
  has_many :food_preps, through: :food_prep_labels
end
