require 'rake'

class UpdateUserPointsJob < ApplicationJob
  # run rake task to update user points "refresh_points"
  queue_as :default

  def perform(*args)
    Quiniela::Application.load_tasks
    Rake::Task['refresh_points'].invoke
  end
end
