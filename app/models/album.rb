class Album < ActiveRecord::Base
  belongs_to :band_site

  attr_accessible :band_site_id, :cover, :title
end
