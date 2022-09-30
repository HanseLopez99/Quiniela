class AlterGames4 < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :winner_team_id
    remove_column :games, :loser_team_id
    add_column :games, :team1, :integer
    add_column :games, :team2, :integer
    add_foreign_key :games, :teams, column: :team1
    add_foreign_key :games, :teams, column: :team2
  end
end
