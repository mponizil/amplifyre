class Track < ActiveRecord::Base

  belongs_to :band_site
  belongs_to :album

  validates :band_site_id, :presence => true

  attr_protected

  mount_uploader :file, AudioUploader

  before_validation :set_defaults

  private

  def set_defaults
    self.album_id ||= -1

    if self.file.try(:file).try(:original_filename)
      filename = self.file.file.original_filename
      self.title ||= filename.chomp(File.extname(filename)).cap_words
    else
      self.title ||= 'Welcome to Amplifyre'
    end

    self.artist ||= self.band_site.name

    self.position ||= Track.where({ :band_site_id => self.band_site_id, :album_id => self.album_id }).count
  end

end
