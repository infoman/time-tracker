class AddIndexesToTimeRecords < ActiveRecord::Migration[6.0]
  def change
    add_index :time_records, [:user_id, :date]
  end
end
