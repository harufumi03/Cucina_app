class RemoveToDoAtFromFoodPreps < ActiveRecord::Migration[6.1]
  def change
    remove_column :food_preps, :to_do_at, :date
  end
end
