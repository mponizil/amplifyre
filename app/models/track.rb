class Track < ActiveRecord::Base

  belongs_to :band_site
  belongs_to :album

  validates :band_site_id, :presence => true

  attr_protected

  mount_uploader :file, AudioUploader

  before_create :set_defaults

  private

  def set_defaults
    if self.file.try(:file).try(:original_filename)
      filename = self.file.file.original_filename
      self.title ||= filename.chomp(File.extname(filename)).cap_words
    else
      self.title ||= 'Welcome to Amplifyre'
    end

    self.artist ||= self.band_site.name

    last_track = Track.order('position').find_last_by_band_site_id_and_album_id(self.band_site_id, self.album_id)
    if last_track
      self.position = last_track.position + 1
    end
  end

end
