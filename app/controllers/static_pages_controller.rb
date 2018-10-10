class StaticPagesController < ApplicationController
  def index

  end
  def home
    @user = User.find_by(id: session[:user_id])
  end
end