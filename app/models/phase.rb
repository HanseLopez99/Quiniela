class Phase < ApplicationRecord
  # Create associations
  has_many :games

  # Create validations for the phase model
  validates :description , presence: true, uniqueness: true
  
end
