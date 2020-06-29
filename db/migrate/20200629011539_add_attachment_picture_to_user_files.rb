class AddAttachmentPictureToUserFiles < ActiveRecord::Migration
  def self.up
    change_table :user_files do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :user_files, :picture
  end
end