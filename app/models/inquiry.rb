# Author: Ameya
class Inquiry < ApplicationRecord
  belongs_to :house
  #belongs_to :real_estate_company
  belongs_to :user

  validates :subject, :presence => true
  validates :message, :presence => true
end