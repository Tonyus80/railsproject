class Comment < ApplicationRecord
  # Relationships
  belongs_to :article
  belongs_to :user
  validates :content, presence: true, length: { minimum: 3, maximum: 2500, too_long: "%{count} Comment is too long"}
end
