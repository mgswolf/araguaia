class Report < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :report_date, :title, :user_id

  attr_accessible :annex
  has_attached_file :annex
end
