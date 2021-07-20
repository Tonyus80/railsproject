json.extract! patient, :id, :name, :surname, :gender, :date_of_birth, :address, :pps, :medical_card, :user_id, :created_at, :updated_at
json.url patient_url(patient, format: :json)
