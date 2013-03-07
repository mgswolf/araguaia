class AddAttachmentAnnexToReports < ActiveRecord::Migration
  def self.up
    change_table :reports do |t|
      t.attachment :annex
    end
  end

  def self.down
    drop_attached_file :reports, :annex
  end
end
