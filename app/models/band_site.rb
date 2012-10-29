class BandSite < ActiveRecord::Base

  belongs_to :user
  has_many :albums
  has_many :concerts
  has_many :pages
  has_many :photos
  has_many :posts
  has_many :socials

  attr_protected

  mount_uploader :background_file, BackgroundUploader

end
