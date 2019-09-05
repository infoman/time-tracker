class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :integer,
      after: :email,
      null: false,
      default: 0
  end
end
