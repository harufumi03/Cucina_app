class CreateFoodPreps < ActiveRecord::Migration[6.1]
  def change
    create_table :food_preps do |t|
      t.string :name
      t.string :ingredient
      t.date :to_do_at

      t.timestamps
    end
  end
end
