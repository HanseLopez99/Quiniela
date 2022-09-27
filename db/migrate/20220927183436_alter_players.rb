class AlterPlayers < ActiveRecord::Migration[7.0]
  def change
    add_reference :players, :users, foreign_key: true
  end

end
