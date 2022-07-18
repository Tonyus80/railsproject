class Patient < ApplicationRecord
  belongs_to :user,dependent: :destroy
  has_many :appointments

  ###Validation
  validates :name_surname, presence: true, length: {minimum: 6}
  validates :gender, presence: true, length: {minimum: 1}
  validates :age, presence: true, length: {minimum: 1}, :numericality => { :greater_than_or_equal_to => 1 } ###Ensure users type numbers only
  #validates :age, :presence => true, :numericality => {:only_integer => true}
  validates :address, presence: true, length: {minimum: 5}
  validates :pps, presence: true, length: {minimum: 4}
  validates :medical_card, presence: true, length: {minimum: 2}

  # Search Methods, show all Patients "if " after click on search the patient is not found [empty]
  def self.name_surname(search)
  #def self.pps(search)
    if !search.empty? then
      @patients = Patient.where(["name_surname LIKE ?", "% #{search.strip.downcase}%"])
    else
      Patient.all
      #@patients = Patient.all
    end
  end


end
