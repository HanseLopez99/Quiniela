require 'rake'

class UpdateUserPointsJob < ApplicationJob
  # run rake task to update user points "calculate_points"
  queue_as :default

  def perform(*args)
    Quiniela::Application.load_tasks
    Rake::Task['calculate_points'].invoke
  end
end
