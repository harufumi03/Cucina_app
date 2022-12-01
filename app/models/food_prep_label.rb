class FoodPrepLabel < ApplicationRecord
  belongs_to :food_prep
  belongs_to :label
end
