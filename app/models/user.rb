# Author: Sam
class User < ApplicationRecord
  has_secure_password

  validates :name, :presence => true
  #can put additional validation here
  validates :email, :presence => true,
            :uniqueness => true
  validates :roles, :presence => true
end