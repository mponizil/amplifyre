class Track < ActiveRecord::Base

  belongs_to :band_site
  belongs_to :album

  validates :band_site_id, :presence => true

  attr_accessible :created_at, :updated_at, :band_site_id, :album_id, :position, :title, :file, :artist

  mount_uploader :file, AudioUploader

  before_validation :set_defaults

  private

  def set_defaults
    self.album_id ||= -1
    self.artist ||= self.band_site.name
    self.position ||= Track.where({ :band_site_id => self.band_site_id, :album_id => self.album_id }).count
    if self.file.try(:file).try(:original_filename)
      self.title ||= File.get_title(self.file.file.original_filename).cap_words
    else
      self.title ||= 'Track ' + (self.position+1).to_s
    end
  end

end
