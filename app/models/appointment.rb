class Appointment < ApplicationRecord
  #esure user has unique appointment date no duplicate allowed
  validates :date, uniqueness: { scope: :user }
  #Testing validation
  #validates :patient_id, presence: true

  belongs_to :user
  belongs_to :patient
end
