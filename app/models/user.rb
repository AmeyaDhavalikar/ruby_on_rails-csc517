class User < ApplicationRecord
  has_secure_password

  has_one :real_estate_company
  has_many :inquiries

  validates_presence_of :email, :name
  #can put additional validation here
  validates :email, :uniqueness => true
  validates :roles, :presence => true
  enum contact_method: [:email,:text, :call]
end