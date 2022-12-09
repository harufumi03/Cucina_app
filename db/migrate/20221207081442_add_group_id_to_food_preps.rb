class AddGroupIdToFoodPreps < ActiveRecord::Migration[6.1]
  def change
    add_reference :food_preps, :group, foreign_key: true
  end
end
