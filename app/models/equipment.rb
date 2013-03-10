# == Schema Information
#
# Table name: equipment
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Equipment < ActiveRecord::Base
  attr_accessible :title, :description, :cover
  validates :title, presence: true, uniqueness: true

  has_attached_file :cover, :styles => { :medium => "320x300>", :thumb => "100x100>" }
  extend FriendlyId
  friendly_id :title, use: :slugged
end
