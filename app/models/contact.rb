class Contact < ActiveRecord::Base
  attr_accessible :body, :email, :name, :phone, :subject

  validates :body, :email, :name, :phone, :subject, presence: true
end
