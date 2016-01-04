class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :tournament_id
      t.string :map
      t.integer :team1_id
      t.integer :team2_id
      t.integer :score_team1
      t.integer :score_team2
      t.string :stream

      t.timestamps null: false
    end
  end
end
