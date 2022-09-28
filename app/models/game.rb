class Game < ApplicationRecord

  # Create validations for the game model
  validates :game_winner, presence: true, numericality: { only_integer: true }
  validates :game_loser, presence: true, numericality: { only_integer: true }
  validates :game_winner_score, presence: true, numericality: { only_integer: true }
  validates :game_loser_score, presence: true, numericality: { only_integer: true }

  # Crate callbacks for the game model
  before_save :set_game_winner
  before_save :set_game_loser

  # Create a method to set the game winner
  def set_game_winner
    if self.game_winner_score > self.game_loser_score
      self.game_winner = self.game_winner
    else
      self.game_winner = self.game_loser
    end
  end

  # Create a method to set the game loser
  def set_game_loser
    if self.game_winner_score < self.game_loser_score
      self.game_loser = self.game_winner
    else
      self.game_loser = self.game_loser
    end
  end

end
