class AlterGames2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :game_winner
    remove_column :games, :game_loser
    remove_column :games, :game_winner_score
    remove_column :games, :game_loser_score
    remove_column :games, :game_date

    add_column :games, :winner_team_id, :integer
    add_column :games, :loser_team_id, :integer
    add_column :games, :winner_team_score, :integer
    add_column :games, :loser_team_score, :integer
    add_column :games, :starting_at, :datetime
  end
end
