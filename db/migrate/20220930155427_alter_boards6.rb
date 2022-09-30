class AlterBoards6 < ActiveRecord::Migration[7.0]
  def change
    remove_column :boards, :team1_id
    remove_column :boards, :team2_id
  end
end
