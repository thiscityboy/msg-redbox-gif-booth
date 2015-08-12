class PhotoSetsController < ApplicationController

  def index
  end

  def new
    @photo_set = PhotoSet.new
  end

  def edit
    @photo_set = PhotoSet.find(params[:id])
    @frames = Frame.find_each.map { |f| f.content.url }
  end

  def create
    @photo_set = PhotoSet.create! photo_set_params
    @photo_set.save_gif!
    redirect_to @photo_set
  end

  def show
    @photo_set = PhotoSet.find(params[:id])
  end

  def update
    @photo_set = PhotoSet.find(params[:id])
    @photo_set.update(photo_set_params)
    redirect_to @photo_set
  end

  def send_photo
  end

  def done
  end

  private

    def photo_set_params
      params.require(:photo_set).permit(:photo1_base64, :photo2_base64, :photo3_base64, :photo4_base64, :photo5_base64, :photo6_base64, :photo7_base64, :photo8_base64, :framed_base64, :mdn)
    end

end
