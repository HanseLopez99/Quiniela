class Board < ApplicationRecord
  # Create associations
  belongs_to :game
  belongs_to :user

  # Create enums for the board model

  scope :by_user, -> (user_id) { where(users_id: user_id) }


end
