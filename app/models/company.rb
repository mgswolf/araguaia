class Company < ActiveRecord::Base
  attr_accessible :description, :title, :cover
  has_attached_file :cover, :styles => { :medium => "320x300>", :thumb => "100x100>" }

  validates :title, presence: true
end
