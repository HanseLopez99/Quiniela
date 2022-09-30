class AlterBoards5 < ActiveRecord::Migration[7.0]
  def change
    remove_column :boards, :team1
    remove_column :boards, :team2
    add_column :boards, :team1_id, :integer
    add_column :boards, :team2_id, :integer
    add_foreign_key :boards, :teams, column: :team1_id
    add_foreign_key :boards, :teams, column: :team2_id
  end
end
