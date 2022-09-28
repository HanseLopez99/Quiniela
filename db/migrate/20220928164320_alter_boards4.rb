class AlterBoards4 < ActiveRecord::Migration[7.0]
  def change
    remove_column :boards, :team1
    remove_column :boards, :team2

    add_column :boards, :team1, :integer
    add_column :boards, :team2, :integer

    add_reference :boards, :games, foreign_key: true
    add_reference :boards, :users, foreign_key: true
    add_foreign_key :boards, :teams, column: :team1
    add_foreign_key :boards, :teams, column: :team2
  end
end
