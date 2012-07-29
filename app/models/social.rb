class Social < ActiveRecord::Base
  belongs_to :band_site

  attr_accessible :link, :type
end
