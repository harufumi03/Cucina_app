class ChangeColumnAddNotnullOnLabels < ActiveRecord::Migration[6.1]
  def change
    change_column :labels, :name, :string, null: false
  end
end
