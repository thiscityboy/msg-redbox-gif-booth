class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    photo = Photo.create! photo_params
    redirect_to capture_photo_url(photo)
  rescue => e
    Rollbar.report_exception(e)
    redirect_to new_photo_url, alert: e.message    
  end

  def capture
    @photo = Photo.find(params[:id])
  end

  def frame
    @photo = Photo.find(params[:id])
  end

  def show
    @photo = Photo.find(params[:id])
  end

  private

    def photo_params
      params.require(:photo).permit(:content_base64, :content_type, :content_filename, :mdn, :family_name)
    end
end
