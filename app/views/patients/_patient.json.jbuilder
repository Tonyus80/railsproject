json.extract! patient, :id, :name_surname, :gender, :age, :address, :pps, :medical_card, :user_id, :created_at, :updated_at
json.url patient_url(patient, format: :json)
