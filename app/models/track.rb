class Track < ActiveRecord::Base
  belongs_to :album
  attr_protected
  mount_uploader :file, AudioUploader
end
