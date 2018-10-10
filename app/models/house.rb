class House < ApplicationRecord
  #belongs_to :real_estate_company

  validates :location, :presence => true
  validates :square_footage, :presence => true
  validates :year, :presence => true, :numericality => {only_integer: true}, length: {is: 4}
  validates :style, :presence => true
  validates :price, :presence => true, :numericality => true
  validates :floors, :presence => true
  validates :basement, :presence => true
  validates :owner, :presence => true
end