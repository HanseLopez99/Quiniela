class AlterGame1s < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :title
    add_column :games, :game_winner, :integer
    add_column :games, :game_loser, :integer
    add_column :games, :game_winner_score, :integer
    add_column :games, :game_loser_score, :integer

    add_foreign_key :games, :teams, column: :game_winner
    add_foreign_key :games, :teams, column: :game_loser
  end
end
