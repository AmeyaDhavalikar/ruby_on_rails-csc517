class House < ApplicationRecord
  belongs_to :real_estate_company

  validates :year_built, :presence => true, numericality: {only_integer: true}, length: {is: 4}
  validates :style, :presence => true
  enum style: [:'Single family house', :'Apartment', :'Condos']
  validates :location, :presence => true
  validates :floors, :presence => true
  enum floors: [:'1', :'2', :'3', :'4+']
  enum basement: [:"Yes", :"No"]
  validates :square_footage, :presence => true, numericality: true
  validates :address, :presence => true
  validates :price, :presence => true, numericality: true
  validates :house_owner, :presence => true

end
