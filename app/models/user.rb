class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #
  validates :email, presence: true, length: {minimum: 10}
  validates :password, presence: true, length: {minimum: 6}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Relationships
  has_many :patients
  has_one :profile
  has_many :appointments
  # Relationships
  has_many :articles, :dependent => :destroy
end
