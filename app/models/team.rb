class Team < ApplicationRecord

  # Create associations
  has_many :games

  # Create validations for the team model
  validates :id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :name, presence: true, uniqueness: true
  
end
