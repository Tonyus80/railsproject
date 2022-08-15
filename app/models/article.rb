class Article < ApplicationRecord
  #belongs_to :comment
  # Relationships
  belongs_to :user #, :optional => true
  has_many :comments
  ##Validation
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 5, maximum: 1000 }

  # Search Methods, show all article "if " empty
  def self.search(search)
    if search.empty? then
      Article.all

    else
      #Article.where('title LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%")## SQLite's for local use
      #Article.where("title::text LIKE ?", "%#{search}%")## PostgreSQL version
      Article.where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
    end
  end

  #TEsting Observer
  before_save :default_values
  ###check the status if 'created'
  enum status: [:created]
  ##execute code if the status 'created' if true
  def default_values
    ###if the value is null assign 'created' value
    self.status = 'created' if self.status.nil?

  end

end
