class Patient < ApplicationRecord
  belongs_to :user,dependent: :destroy
  has_many :appointments

  # Search Methods, show all article "if " empty
  def self.search(search)
    if search.empty? then
      Patient.all


    else
      #where(["name_surname LIKE ?", "% #{search.strip.downcase}%"])
      Patient.where(["name_surname LIKE ?", "% #{search}%"])
      #Patient.where(["pps LIKE ?", "% #{search.strip.downcase}%"])
      Patient.where(["pps LIKE ?", "% #{search.strip.downcase}%"])
      #Patient.where(["pps LIKE ?", "% #{search}%"])
      #where(["pps LIKE ?", "% #{search}%"])
    end
  end


end
