# == Schema Information
#
# Table name: services
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :text
#  caption            :string(255)
#  slug               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  cover_file_name    :string(255)
#  cover_content_type :string(255)
#  cover_file_size    :integer
#  cover_updated_at   :datetime
#

class Service < ActiveRecord::Base
  attr_accessible :caption, :description, :title, :highlight

  attr_accessible :cover
  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :title, presence: true, uniqueness: true
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :highlights, -> { where(:highlight => true).limit(3)}
  scope :normal, -> { where(:highlight => false).order(:title)}
end
