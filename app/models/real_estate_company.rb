class RealEstateCompany < ApplicationRecord

  validates_presence_of :name, :address, :synopsis, :revenue, :size, :website
  # validates :website, :format => URI::regexp(%w(http https))
  validates :year_founded, :presence => true, length: {is: 4}
  enum revenue: [:"Below $100 Million per year", :"$100 Million per year", :"$200 Million per year", :"$300 Million per year", :"$400 Million per year", :"$500 Million per year", :"Above $500 Million per year"]
  enum size: [:"1-50", :"51-200", :"201-500", :"501-1000", :"1000+"]
end
