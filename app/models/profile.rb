class Profile < ApplicationRecord
  # Relationships
  belongs_to :user
  has_one :profile
end
