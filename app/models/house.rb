# Author: Sam and Abhilasha
class House < ApplicationRecord
  #belongs_to :real_estate_company
  #belongs_to :user

  validates :location, :presence => true
  validates :square_footage, :presence => true
  validates :year, :presence => true, :numericality => {only_integer: true}, length: {is: 4}
  validates :style, :presence => true
  validates :price, :presence => true, :numericality => true
  validates :floors, :presence => true
  validates :owner, :presence => true
  validates :company_id, :presence => true

  def self.search_by(search_term)
    where("LOWER(location) LIKE :search_term OR LOWER(price) LIKE :search_term",search_term:"%#{search_term.downcase}")
  end
end