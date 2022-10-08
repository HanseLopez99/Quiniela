class Board < ApplicationRecord
  # Create associations
  belongs_to :game
  belongs_to :user

  # Create validations for the board model
  validates :score1, numericality: { only_integer: true }
  validates :score2, numericality: { only_integer: true }

  # Create enums for the board model

  scope :by_user, -> (user_id) { where(users_id: user_id) }

  def refresh_points
    team1_score = Game.where(id: self.games_id).first.team1_score
    team2_score = Game.where(id: self.games_id).first.team2_score
    user = User.where(id: self.users_id).first

    if self.score1 > self.score2 && team1_score > team2_score
      points_was = user.points
      user.points = user.points + 3
      if user.points > points_was
        puts "########## +3 points for user #{user.first_name} for guessing the team1_score > team2_score"
        user.save
        self.save!
      end
    end
    if self.score1 < self.score2 && team1_score < team2_score
      points_was = user.points
      user.points = user.points + 3
      if user.points > points_was
        puts "########## +3 points for user #{user.first_name} for guessing the team1_score < team2_score"
        user.save
        self.save!
      end
    end
    if self.score1 == self.score2 && team1_score == team2_score
      points_was = user.points
      user.points = user.points + 2
      if user.points > points_was
        puts "########## +2 points for user #{user.first_name} for guessing the the draw"
        user.save
        self.save!
      end
    end
    if self.score1 == team1_score && self.score2 == team2_score
      points_was = user.points
      user.points = user.points + 4
      if user.points > points_was
        puts "########## +4 points for user #{user.first_name} for guessing the exact score"
        user.save
        self.save!
      end
    end        
  end
end
