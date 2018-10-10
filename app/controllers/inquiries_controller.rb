class InquiriesController < ApplicationController
  def inquiry_params
    params.require(:inquiry).permit(:subject, :message_content)
  end
  def new

  end
  def create

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