class Team < ApplicationRecord

  validates :id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :name, presence: true, uniqueness: true
  
end
