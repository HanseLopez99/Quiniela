class Game < ApplicationRecord
  # Create associations
  has_many :boards
  belongs_to :phase
  # belongs_to :team1_id, class_name: "Team"
  # belongs_to :team2_id, class_name: "Team"

  # Create enums or scopes for the team model
  enum status: {
    started: "started",
    unstarted: "unstarted"
  }

  # Crate callbacks for the game model
  after_create :define_title
  before_save :check_is_started


  def check_is_started
    if self.starting_at < Time.now
      self.status = "started"
    else
      self.status = "unstarted"
    end
  end

  def define_title
    team1 = Team.where(id: self.team1_id).first.name.slice(0,3)
    team2 = Team.where(id: self.team2_id).first.name.slice(0,3)
    self.title = "#{team1} vs #{team2}"
    self.save
  end
end

