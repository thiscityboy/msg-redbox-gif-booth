class PhotoSet < ActiveRecord::Base

  belongs_to :frame

  before_save :decode_base64_image

  has_attached_file :photo1, :styles => { :medium => "640x480" }
  has_attached_file :photo2, :styles => { :medium => "640x480" }
  has_attached_file :photo3, :styles => { :medium => "640x480" }
  has_attached_file :photo4, :styles => { :medium => "640x480" }
  has_attached_file :photo5, :styles => { :medium => "640x480" }
  has_attached_file :photo6, :styles => { :medium => "640x480" }
  has_attached_file :photo7, :styles => { :medium => "640x480" }
  has_attached_file :photo8, :styles => { :medium => "640x480" }
  has_attached_file :gif,    :styles => { :medium => "640x480" }


  validates_attachment_content_type :photo1, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo2, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo3, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo4, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo5, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo6, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo7, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo8, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :gif,    :content_type => /\Aimage\/.*\Z/

  def stitch(photo, new_frame)
    photo_framing = []
    photo_framing << photo.url.gsub("https", "http")
    photo_framing << new_frame.content.url.gsub("https", "http")
    photo_list = Magick::ImageList.new(*photo_framing)

    flattened = photo_list.flatten_images
    photo_name = "Framing-#{Random.new.rand(500)}-#{photo.original_filename}"
    flattened.write photo_name
    open photo_name
  end

  def apply_frame!
    self.photo1 = stitch photo1, frame
    self.photo2 = stitch photo2, frame
    self.photo3 = stitch photo3, frame
    self.photo4 = stitch photo4, frame
    self.save
    self.save_gif!
  end

  def to_image_array
    image_urls = []
    image_urls << photo1.url.gsub("https", "http") if photo1.present?
    image_urls << photo2.url.gsub("https", "http") if photo2.present?
    image_urls << photo3.url.gsub("https", "http") if photo3.present?
    image_urls << photo4.url.gsub("https", "http") if photo4.present?
    image_urls << photo5.url.gsub("https", "http") if photo5.present?
    image_urls << photo6.url.gsub("https", "http") if photo6.present?
    image_urls << photo7.url.gsub("https", "http") if photo7.present?
    image_urls << photo8.url.gsub("https", "http") if photo8.present?
    image_urls
  end

  def to_image_list
    Magick::ImageList.new(*to_image_array)
  end

  def to_mp4
    animation = Magick::ImageList.new
    animation.ticks_per_second = 60
    to_image_array.each{ |frame|
      animation.push(frame)
      animation.cur_image.delay = 2
    }
    animation.write("animation-#{id}.mp4")
  end

  def save_gif!
    gif_id = "animated-#{self.id}.gif"
    self.to_image_list.write(gif_id)
    self.gif = open(gif_id)
    self.save
  end

  def send_sms
    shortened_link = UrlShortener.shorten self.gif.url, mdn: self.mdn
    Messages.submit "Here is your photo: #{shortened_link}", self.mdn, "63901"
  end

  private

    def decode_base64_image
      if photo1_base64.present?
        data = StringIO.new(Base64.decode64(photo1_base64.split(',')[1]))
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end
        data.content_type      = "image/png"
        data.original_filename = "snapshot1.png"
        self.photo1 = data
        self.photo1_base64 = nil
      end

      if photo2_base64.present?
        data = StringIO.new(Base64.decode64(photo2_base64.split(',')[1]))
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end
        data.content_type      = "image/png"
        data.original_filename = "snapshot2.png"
        self.photo2 = data
        self.photo2_base64 = nil
      end

      if photo3_base64.present?
        data = StringIO.new(Base64.decode64(photo3_base64.split(',')[1]))
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end
        data.content_type      = "image/png"
        data.original_filename = "snapshot3.png"
        self.photo3 = data
        self.photo3_base64 = nil
      end

      if photo4_base64.present?
        data = StringIO.new(Base64.decode64(photo4_base64.split(',')[1]))
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end
        data.content_type      = "image/png"
        data.original_filename = "snapshot4.png"
        self.photo4 = data
        self.photo4_base64 = nil
      end

      if photo5_base64.present?
        data = StringIO.new(Base64.decode64(photo5_base64.split(',')[1]))
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end
        data.content_type      = "image/png"
        data.original_filename = "snapshot4.png"
        self.photo5 = data
        self.photo5_base64 = nil
      end

      if photo6_base64.present?
        data = StringIO.new(Base64.decode64(photo6_base64.split(',')[1]))
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end
        data.content_type      = "image/png"
        data.original_filename = "snapshot4.png"
        self.photo6 = data
        self.photo6_base64 = nil
      end

      if photo7_base64.present?
        data = StringIO.new(Base64.decode64(photo7_base64.split(',')[1]))
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end
        data.content_type      = "image/png"
        data.original_filename = "snapshot4.png"
        self.photo7 = data
        self.photo7_base64 = nil
      end

      if photo8_base64.present?
        data = StringIO.new(Base64.decode64(photo8_base64.split(',')[1]))
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end
        data.content_type      = "image/png"
        data.original_filename = "snapshot4.png"
        self.photo8 = data
        self.photo8_base64 = nil
      end
    end
end
