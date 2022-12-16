class ChangeColumnAddNotnullOnGorups < ActiveRecord::Migration[6.1]
  def change
    change_column :groups, :name, :string, null: false
    change_column :groups, :owner_id, :integer, null: false
  end
end
