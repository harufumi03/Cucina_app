class AddGroupIdToSelectFoodPrep < ActiveRecord::Migration[6.1]
  def change
    add_reference :select_food_preps, :group, foreign_key: true
  end
end
