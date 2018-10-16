class HousesController < ApplicationController
  def house_params
    params.require(:house).permit(:location, :square_footage, :year, :style, :price, :floors, :basement, :owner, :company_id)
  end

  def new
    @house = House.new
    @user = User.find(session[:user_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @house }
    end
  end

  def create
    @user = User.find(session[:user_id])
    if @user.roles != 2 && !@user.company_id.nil?
      @house = House.new(house_params)
      @house.company_id = @user.company_id
      respond_to do |format|
        if @house.save
          format.html { redirect_to @house, notice: 'House was successfully listed.' }
          format.json { render json: @house, status: :created, location: @house }
        else
          format.html { render action: "new" }
          format.json { render json: @house.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def edit
    @house = House.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    @house = House.find(params[:id])
    if @user.roles != 2 && @user.id == @house.realtor_id

      respond_to do |format|
        if @house.update_attributes(house_params)
          format.html { redirect_to @house, notice: 'House was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @house.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def index
    @user = User.find(session[:user_id])
    @houses = House.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @houses }
    end
  end

  def show
    @house = House.find(params[:id])
    @user = User.find(session[:user_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house }
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @house = House.find(params[:id])
    if @user.roles != 2 && @user.company_id == @house.company_id
      @house.destroy

      respond_to do |format|
        format.html { redirect_to houses_url }
        format.json { head :no_content }
      end
    end
  end
end