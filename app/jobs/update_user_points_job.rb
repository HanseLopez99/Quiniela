require 'rake'

class UpdateUserPointsJob < ApplicationJob
  # run rake task to update user points "refresh_points"
  queue_as :default

  def perform(*args)
    Quiniela::Application.load_tasks
    Rake::Task['refresh_points'].invoke
  
    # For each user, update points based on the board
    User.all.each do |user|
      Board.by_user(user.id).each do |board|
        board.refresh_points
      end
    end  
  end
end
