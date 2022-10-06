class ScoreboardController < ApplicationController
  def index
    @users = User.all
    @games = Game.all
    @teams = Team.all
    @boards = Board.all
  end

  def show
    @users = User.order(points: :desc)
    @games = Game.all
    @teams = Team.all
    @boards = Board.all
  end
end