class PhotosController < ApplicationController

  def index
    @stop = Stop.find(params[:stop_id])
  end

  def new
    @photo = Photo.new
    @stop  = Stop.find(params[:stop_id])
  end

  def capture
    @photo = Photo.find(params[:id])
    @stop = @photo.stop
  end

  def frame
    @photo = Photo.find(params[:id])
    @stop = @photo.stop
    @frames = Frame.first(3).map { |f| f.content.url }
  end

  def show
    @photo = Photo.find(params[:id])
    @stop = @photo.stop
  end

  def create
    photo = Photo.create! photo_params
    redirect_to capture_photo_url(photo)
  rescue => e
    Rollbar.report_exception(e)
    redirect_to new_stop_photo_url, alert: e.message
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update!(photo_params)
    redirect_to params[:redirect_to]
  rescue => e
    Rollbar.report_exception(e)
    redirect_to capture_photo_url(@photo), alert: e.message
  end

  def sms
    @photo = Photo.find(params[:id])
    picture_url = MsgToolbox.shorten_url @photo.framed.url, ENV["CAMPAIGN_ID"].to_i, @photo.mdn, ENV["ACCOUNT_ID"].to_i, ENV["SHORT_CODE"], nil
    MsgToolbox.send_message @photo.mdn, "Click here to view your Harvest Moon photo #{picture_url}", ENV['SHORT_CODE']
    redirect_to stop_photos_url(@photo.stop), notice: "<strong>Check your phone.</strong> Your Harvest Moon photo is on its way!"
  rescue => e
    Rollbar.report_exception(e)
    redirect_to stop_photos_url(@photo.stop), alert: e.message
  end

  def view
    @photo = Photo.find(params[:id])
    @stop = @photo.stop
  end

  private

    def photo_params
      params.require(:photo).permit(:content_base64, :content_type, :content_filename, :mdn, :family_name, :framed_base64, :framed_type, :framed_filename, :stop_id)
    end

end
