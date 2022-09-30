class User < ApplicationRecord
  # Create associations
  has_many :boards

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Create validations for the user model
  validates :id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :email , presence: true, uniqueness: true 
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age , presence: true, numericality: { only_integer: true }

  # Create callbacks for the user model

  after_initialize :set_defaults

  # Create a method to set the default points
  def set_defaults
    self.points ||= 0
  end

end
