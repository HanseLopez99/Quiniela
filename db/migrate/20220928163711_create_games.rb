class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.datetime :game_date

      t.timestamps
    end
  end
end
