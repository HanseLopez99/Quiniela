class AlterGames5 < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :team1
    remove_column :games, :team2
    add_column :games, :team1_id, :integer
    add_column :games, :team2_id, :integer
    add_foreign_key :games, :teams, column: :team1_id
    add_foreign_key :games, :teams, column: :team2_id
  end
end
