class Game < ApplicationRecord

  # Create enums or scopes for the team model
  enum status: {
    started: :started,
    not_started: :not_started
  }

  # Crate callbacks for the game model
  before_save :check_is_started


  # Create a method to set the game winner
  def check_is_started
    if self.starting_at < Time.now
      self.status = "started"
    else
      self.status = "not_started"
    end
  end

end

