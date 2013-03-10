# == Schema Information
#
# Table name: reports
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  report_date        :date
#  description        :text
#  user_id            :integer
#  slug               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  annex_file_name    :string(255)
#  annex_content_type :string(255)
#  annex_file_size    :integer
#  annex_updated_at   :datetime
#

class Report < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :report_date, :title, :user_id

  attr_accessible :annex
  has_attached_file :annex
  extend FriendlyId
  friendly_id :title, use: :slugged
end
