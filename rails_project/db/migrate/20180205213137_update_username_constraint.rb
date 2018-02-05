class UpdateUsernameConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :username, :string, null: false
    change_column :users, :username, :string, unique: true
  end
end
