class CreateFoodPrepLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :food_prep_labels do |t|
      t.references :food_prep, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
