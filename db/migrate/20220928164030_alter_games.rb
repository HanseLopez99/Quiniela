class AlterGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :phases, foreign_key: true
  end
end
