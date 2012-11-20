class Album < ActiveRecord::Base

  belongs_to :band_site

  has_many :tracks

  attr_protected

  mount_uploader :cover_file, ImageUploader

  before_create :set_defaults

  private

  def set_defaults
    if self.cover_file.try(:file).try(:original_filename)
      filename = self.cover_file.file.original_filename
      self.title ||= filename.chomp(File.extname(filename)).cap_words
    else
      self.title ||= 'Welcome to Amplifyre'
    end

    self.position ||= Album.where({ :band_site_id => self.band_site_id }).count
  end

end
