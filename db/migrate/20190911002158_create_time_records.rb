class CreateTimeRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :time_records do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.date :date, null: false
      t.decimal :hours, null: false, default: 0, precision: 4, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
