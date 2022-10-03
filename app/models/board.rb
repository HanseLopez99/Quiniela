class Board < ApplicationRecord
  # Create associations
  belongs_to :game
  belongs_to :user

  # Create validations for the board model
  validates :score1, presence: true, numericality: { only_integer: true }
  validates :score2, presence: true, numericality: { only_integer: true }
  validates :games_id, presence: true, numericality: { only_integer: true }
  validates :users_id, presence: true, numericality: { only_integer: true }

  # Create enums for the board model

  # status true if the two scores are filled
  enum status: { 
    not_filled: 0,
    filled: 1
  }

  scope :by_user, -> (user_id) { where(users_id: user_id) }

  # Create callbacks to manage user points
  before_save :set_user_points

  # Create a method to set the user points
  def set_user_points
    if self.team1_score > self.team2_score
      self.user_points = 1
    else
      self.user_points = 0
    end
  end

  # Insert points into the user table
  def insert_points
    user = User.find(self.users_id)
    user.points = user.points + self.user_points
    user.save
  end

end
