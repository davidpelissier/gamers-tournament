class CreateBoTournaments < ActiveRecord::Migration
  def change
    create_table :bo_tournaments do |t|
      t.integer :bo_id
      t.integer :tournament_id

      t.timestamps null: false
    end
  end
end
