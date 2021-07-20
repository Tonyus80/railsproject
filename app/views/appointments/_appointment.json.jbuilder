json.extract! appointment, :id, :date, :comment, :visited, :user_id, :patient_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
