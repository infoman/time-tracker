class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.string :full_name
      t.integer :expected_hours, null: false, default: 0

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        say_with_time 'Updating users' do
          User.all.each { |u| u.create_profile! }
        end
      end
    end
  end
end
