class StaticPagesController < ApplicationController
  def index

  end
  def home
    @user = User.find_by(id: session[:user_id])
    @real_estate_company = RealEstateCompany.find_by(id: @user.company_id)
    if @real_estate_company

    end
  end
end