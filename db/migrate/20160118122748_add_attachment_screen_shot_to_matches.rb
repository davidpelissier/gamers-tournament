class AddAttachmentScreenShotToMatches < ActiveRecord::Migration
  def self.up
    change_table :matches do |t|
      t.attachment :screen_shot
    end
  end

  def self.down
    remove_attachment :matches, :screen_shot
  end
end
