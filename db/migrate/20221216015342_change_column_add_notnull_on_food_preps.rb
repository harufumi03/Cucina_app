class ChangeColumnAddNotnullOnFoodPreps < ActiveRecord::Migration[6.1]
  def change
    change_column :food_preps, :name, :string, null: false
    change_column :food_preps, :ingredient, :string, null: false
    change_column :food_preps, :group_id, :bigint, null: false
  end
end
