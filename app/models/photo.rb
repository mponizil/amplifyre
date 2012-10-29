class Photo < ActiveRecord::Base
  belongs_to :band_site
  attr_protected
  mount_uploader :file, ImageUploader
end
