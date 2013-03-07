class AddAttachmentCoverToJobs < ActiveRecord::Migration
  def self.up
    change_table :jobs do |t|
      t.attachment :cover
    end
  end

  def self.down
    drop_attached_file :jobs, :cover
  end
end
