class InquiriesController < ApplicationController
  def inquiry_params
    params.require(:inquiry).permit(:subject, :message)
  end
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.house_id = params[:id]

    respond_to do |format|
      if @inquiry.save
        format.html { redirect_to root_path, notice: 'Inquiry was successfully created.' }
        format.json { render json: @inquiry, status: :created, location: home_path }
      else
        format.html { render action: "new" }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit

  end
  def update

  end
  def show

  end
  def destroy

  end
end