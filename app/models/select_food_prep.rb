class SelectFoodPrep < ApplicationRecord
  belongs_to :user
  belongs_to :food_prep
end
