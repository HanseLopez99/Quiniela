class Game < ApplicationRecord
  # Create associations
  belongs_to :phase
  belongs_to :teams, class_name: "Team", foreign_key: "team1_id"
  belongs_to :teams, class_name: "Team", foreign_key: "team2_id"
  has_many :boards

  # Create validations for the game model
  validates :team1_id, presence: true, numericality: { only_integer: true }
  validates :team2_id, presence: true, numericality: { only_integer: true }
  validates :phases_id, presence: true, numericality: { only_integer: true }
  validates :team1_score, presence: true, numericality: { only_integer: true }
  validates :team2_score, presence: true, numericality: { only_integer: true }
  validates :starting_at, presence: true

  # Create enums or scopes for the team model
  enum status: {
    started: :started,
    finished: :finished
  }

  # Crate callbacks for the game model
  before_save :set_game_winner
  before_save :set_game_loser

  # Create a method to set the game winner


end
