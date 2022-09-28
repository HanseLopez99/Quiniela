class AlterBoards3 < ActiveRecord::Migration[7.0]
  def change
    remove_reference :boards, :users, foreign_key: true
  end
end
