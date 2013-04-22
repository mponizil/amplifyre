class Concert < ActiveRecord::Base
  belongs_to :band_site
  attr_accessible :created_at, :updated_at, :band_site_id, :date, :venue, :details,
    :photo_file, :link
  mount_uploader :photo_file, ImageUploader
end
