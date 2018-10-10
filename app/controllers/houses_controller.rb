class HousesController < ApplicationController
  def house_params
    params.require(:house).permit(:location, :square_footage, :year, :style, :price, :floors, :basement, :owner)
  end

  def new
    @house = House.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @house }
    end
  end

  def create
    @house = House.new(house_params)

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

  def edit
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])

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

  def index
    @houses = House.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @houses }
    end
  end

  def show
    @house = House.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house }
    end
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy

    respond_to do |format|
      format.html { redirect_to houses_url }
      format.json { head :no_content }
    end
  end

end