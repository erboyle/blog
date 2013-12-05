class AddAttachmentAudioToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :audio
    end
  end

  def self.down
    drop_attached_file :posts, :audio
  end
end
