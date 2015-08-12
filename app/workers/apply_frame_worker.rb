class ApplyFrameWorker
  include Sidekiq::Worker

  def perform(photo_set_id)
    photo_set = PhotoSet.find(photo_set_id)
    photo_set.apply_frame!
  end

end