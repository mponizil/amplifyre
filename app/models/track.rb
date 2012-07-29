class Track < ActiveRecord::Base
  belongs_to :album

  attr_accessible :album_id, :artist, :file, :title
end
