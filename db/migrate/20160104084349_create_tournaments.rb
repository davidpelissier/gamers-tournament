class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.text :description
      t.integer :game_id
      t.integer :teams_limit
      t.datetime :signup_start
      t.datetime :signup_end
      t.datetime :check_in
      t.datetime :date
      t.integer :mode

      t.timestamps null: false
    end
  end
end
