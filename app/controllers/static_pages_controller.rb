class StaticPagesController < ApplicationController
  def index

  end
  def home
    @user = User.find_by(id: session[:user_id])
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      redirect_to root_path
    else
      @real_estate_company = RealEstateCompany.find_by(id: @user.company_id)
    end
  end
end