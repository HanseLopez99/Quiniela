class AlterGames7 < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :status, :string, default: "not_started"
  end
end
