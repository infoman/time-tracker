json.extract! time_record, :id, :user_id, :date, :hours, :description, :created_at, :updated_at
json.url time_record_url(time_record, format: :json)
