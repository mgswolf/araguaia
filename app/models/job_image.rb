# == Schema Information
#
# Table name: job_images
#
#  id               :integer          not null, primary key
#  job_id           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  pic_file_name    :string(255)
#  pic_content_type :string(255)
#  pic_file_size    :integer
#  pic_updated_at   :datetime
#

class JobImage < ActiveRecord::Base
  belongs_to :job
  # attr_accessible :title, :body
  #validates :job, presence: true

  attr_accessible :pic
  has_attached_file :pic, :styles => { :medium => "320x300>", :thumb => "100x100>" }
end
