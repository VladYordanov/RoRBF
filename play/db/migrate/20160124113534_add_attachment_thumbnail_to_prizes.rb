class AddAttachmentThumbnailToPrizes < ActiveRecord::Migration
  def self.up
    change_table :prizes do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :prizes, :thumbnail
  end
end
