class AddReferencesToFoodPreps < ActiveRecord::Migration[6.1]
  def change
    add_reference :food_preps, :user, foreign_key: true
  end
end
