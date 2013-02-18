class Service < ActiveRecord::Base
  attr_accessible :caption, :description, :title

  attr_accessible :cover
  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :title, presence: true
end
