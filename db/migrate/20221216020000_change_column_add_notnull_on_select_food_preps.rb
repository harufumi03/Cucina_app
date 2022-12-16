class ChangeColumnAddNotnullOnSelectFoodPreps < ActiveRecord::Migration[6.1]
  def change
    change_column :select_food_preps, :group_id, :bigint, null: false
  end
end
