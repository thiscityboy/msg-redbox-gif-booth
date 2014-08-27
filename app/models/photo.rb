class Photo < ActiveRecord::Base
  validates :family_name, { presence: true }
  validates :mdn, { presence: true }
end
