class RealEstateCompaniesController < ApplicationController
  def real_estate_company_params
    params.require(:real_estate_company).permit(:name, :website, :address, :size, :founded, :revenue, :synopsis)
  end

  def new
    @real_estate_company = RealEstateCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @real_estate_company }
    end
  end

  def create
    @real_estate_company = RealEstateCompany.new(real_estate_company_params)

    respond_to do |format|
      if @real_estate_company.save
        format.html { redirect_to @real_estate_company, notice: 'User was successfully created.' }
        format.json { render json: @real_estate_company, status: :created, location: @real_estate_company }
      else
        format.html { render action: "new" }
        format.json { render json: @real_estate_company.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @real_estate_company = RealEstateCompany.find(params[:id])
  end

  def update
    @real_estate_company = RealEstateCompany.find(params[:id])

    respond_to do |format|
      if @real_estate_company.update_attributes(real_estate_company_params)
        format.html { redirect_to @real_estate_company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @real_estate_company.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @real_estate_companies = RealEstateCompany.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @real_estate_companies }
    end
  end

  def show
    @real_estate_company = RealEstateCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @real_estate_company }
    end
  end

  def destroy
    @real_estate_company = RealEstateCompany.find(params[:id])
    @real_estate_company.destroy

    respond_to do |format|
      format.html { redirect_to real_estate_companies_url }
      format.json { head :no_content }
    end
  end

end