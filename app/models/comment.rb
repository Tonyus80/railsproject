class Comment < ApplicationRecord
  # Relationships
  belongs_to :article
  belongs_to :user
end
