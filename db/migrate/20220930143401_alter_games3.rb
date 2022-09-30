class AlterGames3 < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :games, :teams, column: :winner_team_id
    add_foreign_key :games, :teams, column: :loser_team_id
  end
end
