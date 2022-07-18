class Profile < ApplicationRecord
  # Relationships
  belongs_to :user
  has_one :profile ,dependent: :destroy
  #has_one :profile,dependent: :destroy

  ###Validation
  validates :firstname, presence: true, length: {minimum: 3}
  validates :lastname, presence: true, length: {minimum: 3}
  validates :address, presence: true, length: {minimum: 5}
  validates :medical_license, presence: true, length: {minimum: 4}, :numericality => { :greater_than_or_equal_to => 0 } ###Ensure users type numbers only
  validates :pps_num, presence: true, length: {minimum: 4}


end
