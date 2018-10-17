# Author: Ameya
class InquiriesController < ApplicationController
  def inquiry_params
    params.require(:inquiry).permit(:subject, :message)
  end
  def new
    @inquiry = Inquiry.new(inquiry_params)
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    if @user.roles != 1
      @inquiry = Inquiry.new(inquiry_params)
      respond_to do |format|
        if @inquiry.save
          format.html { redirect_to @inquiry, notice: 'Inquiry was successfully created.' }
          format.json { render json: @inquiry, status: :created, location: @inquiry }
        else
          format.html { render action: "new" }
          format.json { render json: @inquiry.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    @user = User.find(session[:user_id])
    respond_to do |format|
      if @inquiry.update_attributes(inquiry_params)
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    @user = User.find(session[:user_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inquiry }
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @user = User.find(session[:user_id])
    @inquiry.destroy

    respond_to do |format|
      format.html { redirect_to inquiries_url }
      format.json { head :no_content }
    end
  end
end