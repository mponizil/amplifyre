class Concert < ActiveRecord::Base
  belongs_to :band_site

  attr_protected
end
