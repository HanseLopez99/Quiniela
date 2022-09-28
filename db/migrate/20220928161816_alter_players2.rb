class AlterPlayers2 < ActiveRecord::Migration[7.0]
  def change
    remove_reference :players, :users, foreign_key: true
  end
end
