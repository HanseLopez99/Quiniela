class Board < ApplicationRecord
  # Create associations
  # belongs_to :game
  # belongs_to :user

  # Create validations for the board model
  validates :score1, numericality: { only_integer: true }
  validates :score2, numericality: { only_integer: true }

  # Create enums for the board model

  scope :by_user, -> (user_id) { where(users_id: user_id) }

  def refresh_points
    team1_score = Game.where(id: self.games_id).first.team1_score
    team2_score = Game.where(id: self.games_id).first.team2_score

    if self.score1 > self.score2 && team1_score > team2_score
      user = User.where(id: self.users_id).first
      user.points = user.points + 3
    elsif self.score1 < self.score2 && team1_score < team2_score
      user = User.where(id: self.users_id).first
      user.points = user.points + 3
    elsif self.score1 == self.score2 && team1_score == team2_score
      user = User.where(id: self.users_id).first
      user.points = user.points + 2
    elsif self.score1 == team1_score && self.score2 == team2_score
      user = User.where(id: self.users_id).first
      user.points = user.points + 4
    else
      user = User.where(id: self.users_id).first
      user.points = user.points + 0
    end

    self.save
  end
end
