class User < ApplicationRecord
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

end
