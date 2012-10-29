class Track < ActiveRecord::Base
  belongs_to :band_site
  belongs_to :album
  attr_protected
  mount_uploader :file, AudioUploader

  before_save :set_defaults

  private

  def set_defaults
    filename = self.file.file.original_filename
    self.title ||= filename.chomp(File.extname(filename))
    self.artist ||= self.band_site.name
  end
end
