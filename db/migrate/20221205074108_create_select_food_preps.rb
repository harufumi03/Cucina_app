class CreateSelectFoodPreps < ActiveRecord::Migration[6.1]
  def change
    create_table :select_food_preps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :food_prep, null: false, foreign_key: true
      t.date :to_do_at, null: false

      t.timestamps
    end
  end
end
