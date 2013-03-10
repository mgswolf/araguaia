class Banner < ActiveRecord::Base
  attr_accessible :cover
  has_attached_file :cover, :styles => { :medium => "944x238>", :thumb => "236x60>" }
end
