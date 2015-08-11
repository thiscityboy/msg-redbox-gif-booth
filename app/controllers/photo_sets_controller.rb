class PhotoSetsController < ApplicationController

  def index
  end

  def new
    @photo_set = PhotoSet.new
  end

  def edit
    @photo_set = PhotoSet.find(params[:id])
    @frames = Frame.first(3).map { |f| f.content.url }
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
  end

  def send_photo
  end

  def done
  end

  private

    def photo_set_params
      params.require(:photo_set).permit(:photo1_base64, :photo1_filename, :photo2_base64, :photo2_filename, :photo3_base64, :photo3_filename, :photo4_base64, :photo4_filename, :mdn)
    end

end
