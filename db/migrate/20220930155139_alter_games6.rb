class AlterGames6 < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :winner_team_score
    remove_column :games, :loser_team_score
    add_column :games, :team1_score, :integer
    add_column :games, :team2_score, :integer
  end
end
