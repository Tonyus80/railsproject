class Article < ApplicationRecord
  #belongs_to :comment
  # Relationships
  belongs_to :user #, :optional => true
  has_many :comments
  ##Validation
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }

  # Search Methods, compares value in search to values of Title and Description
  def self.search(search)
    if search

      where(["Title LIKE ?", "% #{search}%"])
      where(["Description LIKE ?", "% #{search}%"])

    else
      all
    end
  end

end
