class SendPhotoSetWorker
  include Sidekiq::Worker

  def perform(photo_set_id)
    photo_set = PhotoSet.find(photo_set_id)
    photo_set.send_sms
  end
end