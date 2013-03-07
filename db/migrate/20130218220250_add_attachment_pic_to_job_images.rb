class AddAttachmentPicToJobImages < ActiveRecord::Migration
  def self.up
    change_table :job_images do |t|
      t.attachment :pic
    end
  end

  def self.down
    drop_attached_file :job_images, :pic
  end
end
