class HousesController < ApplicationController
  def house_params
    params.require(:house).permit(:location, :square_footage, :year, :style, :price, :floors, :basement, :owner, :realtor_id)
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
    if User.find(session[:user_id]).roles != 2
      @house = House.new(house_params)
      @house.realtor_id = session[:user_id]
      respond_to do |format|
        if @house.save
          format.html { redirect_to @house, notice: 'User was successfully created.' }
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
          format.html { redirect_to @house, notice: 'Company was successfully updated.' }
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
    @house = @house = House.find(params[:id])
    if @user.roles != 2 && @user.id == @house.realtor_id
      @house.destroy

      respond_to do |format|
        format.html { redirect_to houses_url }
        format.json { head :no_content }
      end
    end
  end
end