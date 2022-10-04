class AlterGames8 < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :status

    add_column :games, :status, :string, default: "unstarted"
  end
end
