class Photo < ActiveRecord::Base
  before_save :decode_base64_image

  belongs_to :stop

  has_attached_file :content, :styles => { :medium => "640x480" }
  has_attached_file :framed, :styles => { :medium => "740x680" }

  validates :family_name, { presence: true }
  validates :mdn, { presence: true }

  validates_attachment_content_type :content, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :framed, :content_type => /\Aimage\/.*\Z/

  private

    def decode_base64_image
      if content_base64
        data = StringIO.new(Base64.decode64(content_base64.split(',')[1]))
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end
        data.content_type      = self.content_type
        data.original_filename = self.content_filename
        self.content = data
        self.content_base64 = nil
      end

      if framed_base64
        data = StringIO.new(Base64.decode64(framed_base64.split(',')[1]))
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end
        data.content_type      = self.framed_type
        data.original_filename = self.framed_filename
        self.framed = data
        self.framed_base64 = nil
      end
    end
end
