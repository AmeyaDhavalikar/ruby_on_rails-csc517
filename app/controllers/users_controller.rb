# Author: Sam
class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :email, :password, :roles, :company_id, :phone_number, :preferred_contact_method)
  end

  def index
    if User.find(session[:user_id]).roles == 0
      @users = User.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @users }
      end
    end
  end

  def show
    if params[:id].to_s == session[:user_id].to_s || User.find(session[:user_id]).roles == 0
      @user = User.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
          format.html { redirect_to home_path, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    if params[:id].to_s == session[:user_id].to_s || User.find(session[:user_id]).roles == 0
      @user = User.find(params[:id])
    else
      redirect_to home_path
    end
  end

  def choose
    @real_estate_companies = RealEstateCompany.all
    @user = User.find(session[:user_id])
  end

  def update
    if params[:id].to_s == session[:user_id].to_s || User.find(session[:user_id]).roles == 0
      @user = User.find(params[:id])

      respond_to do |format|
        if @user.update_attributes(user_params)
          format.html { redirect_to '/home', notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to home_path
    end
  end

  def destroy
    @logged_in = User.find(session[:user_id])
    if @logged_in.id == params[:id] || @logged_in.roles == 0
      @user = User.find(params[:id])
      @user.destroy

      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
    end
  end
end