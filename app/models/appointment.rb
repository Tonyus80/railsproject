class Appointment < ApplicationRecord
  #esure user has unique appointment date no duplicate allowed
  validates :date, uniqueness: { scope: :user }
  #Testing validation
  validates :comment, presence: true, length: {minimum: 3}
  validates :visited, presence: true, length: {minimum: 1}
  #validates :patient_id, presence: true, length: {minimum: 1}


  belongs_to :user
  belongs_to :patient
end
