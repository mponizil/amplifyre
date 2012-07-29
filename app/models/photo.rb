class Photo < ActiveRecord::Base
  belongs_to :band_site

  attr_accessible :file
end
