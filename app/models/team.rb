class Team < ApplicationRecord

  # Create associations
  has_many :games, foreign_key: "team1_id"
  has_many :games, foreign_key: "team2_id"

  # Create validations for the team model
  validates :name, presence: true, uniqueness: true

  # Create enums or scopes for the team model

  enum status: {
    active: :active,
    inactive: :inactive
  }
  
end
