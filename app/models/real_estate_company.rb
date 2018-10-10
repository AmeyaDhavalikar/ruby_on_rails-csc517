class RealEstateCompany < ApplicationRecord
  has_many :users

  validates :name, :presence => true
  validates :website, :presence => true
  validates :address, :presence => true
  validates :size, :presence => true
  validates :founded, :presence => true
  validates :revenue, :presence => true
end