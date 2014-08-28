class Frame < ActiveRecord::Base
  has_attached_file :content, :styles => { :medium => "740x680" }  
  validates_attachment_content_type :content, :content_type => /\Aimage\/.*\Z/   
end
