class CreateBos < ActiveRecord::Migration
  def change
    create_table :bos do |t|
      t.string :name
      t.string :phase

      t.timestamps null: false
    end
  end
end
