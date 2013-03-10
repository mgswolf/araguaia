# == Schema Information
#
# Table name: jobs
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  caption            :string(255)
#  description        :text
#  slug               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  cover_file_name    :string(255)
#  cover_content_type :string(255)
#  cover_file_size    :integer
#  cover_updated_at   :datetime
#

class Job < ActiveRecord::Base
  attr_accessible :caption, :description, :title, :cover, :job_images_attributes
  has_many :job_images

  accepts_nested_attributes_for :job_images, :reject_if => :all_blank,
                                :allow_destroy => true

  has_attached_file :cover, :styles => { :medium => "320x300>", :thumb => "100x100>" }

  validates :title, presence: true
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :recent, -> {order('created_at DESC').limit(5)}
end
